import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bkdschool/data/models/questionmodal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class FireRepo {
  static final FireRepo instance = FireRepo._internal();
  factory FireRepo() {
    return instance;
  }
  FireRepo._internal();

  final db = FirebaseFirestore.instance;

  RUser currentUser;
  Box saveBox;

  static CollectionReference usersCollection;
  static CollectionReference classesCollection;
  static CollectionReference notificationCollection;
  static CollectionReference examQuestionCollection;

  Future<void> init() async {
    saveBox = await Hive.openBox('global');
    usersCollection = db.collection('users');
    classesCollection = db.collection('classes');
    notificationCollection = db.collection('notification');
    examQuestionCollection = db.collection('examquestion');
  }

  static CollectionReference getSubjectsCollection(RClass rclass) =>
      classesCollection.doc(rclass.docid).collection('subjects');
  static CollectionReference getMessagesCollection(RSubject subject) =>
      getSubjectsCollection(subject.rclass)
          .doc(subject.docid)
          .collection('messages');
  //
  //
  //User
  //
  //

  Future<void> createNewUser(RUser user) async {
    await usersCollection.add(user.toMap());
  }

  Future<RUser> validateUserLoginInfo(String username, String password) async {
    var r = await FireRepo.usersCollection
        .where(
          'username',
          isEqualTo: username,
        )
        .where(
          'password',
          isEqualTo: password,
        )
        .get();
    if (r.size >= 1) {
      return RUser.fromMap(r.docs.first.data())..uid = r.docs.first.id;
    } else {
      return null;
    }
  }

  Future<void> deleteUser(RUser user) async {
    await usersCollection.doc(user.uid).delete();
  }

  Future<void> updateUser(RUser user) async {
    await usersCollection.doc(user.uid).update(user.toMap());
  }

  Future<RUser> getRUserFromUID(String uid) async {
    final doc = await usersCollection.doc(uid).get();
    if (doc.exists) {
      return RUser.fromMap(doc.data())..uid = uid;
    } else
      return null;
  }

  Stream<List<RUser>> getAllUsersStream(RUserType type) async* {
    yield* usersCollection.where('type', isEqualTo: type.value).snapshots().map(
        (event) => event.docs
            .map((e) => RUser.fromMap(e.data())..uid = e.id)
            .toList());
  }

  Stream<List<RUser>> getAllStudentsOfClass(RClass rclass) async* {
    yield* usersCollection
        .where('class_access', isEqualTo: rclass.docid)
        .snapshots()
        .map((event) => event.docs
            .map((e) => RUser.fromMap(e.data())..uid = e.id)
            .toList());
  }

  Future<bool> isRegisteredUser(String username) async {
    var r = await FireRepo.usersCollection
        .where('username', isEqualTo: username)
        .get();
    return r.size >= 1 ? true : false;
  }

//notification

  createNewNotification(RNotification notification) {
    notificationCollection.add(notification.toMap());
  }

  updateNotification(RNotification notification) {
    notificationCollection.doc(notification.docid).update(notification.toMap());
  }

  deleteNotification(RNotification notification) {
    notificationCollection.doc(notification.docid).delete();
  }

  Stream<List<RNotification>> getNotificationStream() async* {
    yield* notificationCollection.snapshots().map((event) => event.docs
        .map((e) => RNotification.fromMap(e.data())..docid = e.id)
        .toList());
  }

//notification

//Question

  createNewQuestion(RExamQsn examquestion) {
    examQuestionCollection.add(examquestion.toMap());
  }

  updateQuestion(RExamQsn examquestion) {
    examQuestionCollection.doc(examquestion.docid).update(examquestion.toMap());
  }

  deleteQuestion(RExamQsn examquestion) {
    examQuestionCollection.doc(examquestion.docid).delete();
  }

  Stream<List<RExamQsn>> getQuestionStream() async* {
    yield* examQuestionCollection.snapshots().map((event) => event.docs
        .map((e) => RExamQsn.fromMap(e.data())..docid = e.id)
        .toList());
  }

//Question

  //
  // Class
  //
  Future<List<RClass>> getClassesList() async {
    final snap = await classesCollection.get();
    return snap.docs
        .map((e) => RClass.fromMap(e.data())..docid = e.id)
        .toList();
  }

  Future<RClass> getClassFromID(String docid) async {
    var snap = await classesCollection.doc(docid).get();
    return RClass.fromMap(snap.data())..docid = docid;
  }

  Stream<List<RClass>> getClassesListStream() async* {
    yield* classesCollection.snapshots().map((event) =>
        event.docs.map((e) => RClass.fromMap(e.data())..docid = e.id).toList());
  }

  Stream<List<RSubject>> getSubjectsListStream(RClass rclass) async* {
    yield* getSubjectsCollection(rclass).snapshots().map((event) => event.docs
        .map((e) => RSubject.fromMap(e.data())
          ..docid = e.id
          ..rclass = rclass)
        .toList());
  }

  Future<void> addNewClass(RClass rclass) async {
    await classesCollection.add(rclass.toMap());
  }

  Future<void> addNewSubject(RSubject subject) async {
    await getSubjectsCollection(subject.rclass).add(subject.toMap());
  }

  Future<List<RSubject>> getSubjectsOfClass(RClass rclass) async {
    final snap = await getSubjectsCollection(rclass).get();
    return snap.docs
        .map((e) => RSubject.fromMap(e.data())
          ..docid = e.id
          ..rclass = rclass)
        .toList();
  }

  Future<RSubject> getSubjectFromID(String classid, String subid) async {
    var r =
        await getSubjectsCollection(RClass(docid: classid)).doc(subid).get();
    return RSubject.fromMap(r.data())..docid = r.id;
  }

  //
  //Message
  //

  Future<List<RMessage>> getMessages(RSubject subject) async {
    var box = await ChatRepo.instance.getSubjectBox(subject.docid);
    if (box.isEmpty) {
      return [];
    }
    RMessage lastMessage = RMessage.fromLocalMap(box.values.last);
    final snap = await getMessagesCollection(subject)
        .where('timestamp',
            isGreaterThan: lastMessage.timestamp.millisecondsSinceEpoch)
        .get();
    return snap.docs
        .map((e) => RMessage.fromMap(e.data())..docid = e.id)
        .toList();
  }

  Future<List<RMessage>> getAllMessages(RSubject subject) async {
    final snap =
        await getMessagesCollection(subject).orderBy('timestamp').get();
    return snap.docs
        .map((e) => RMessage.fromMap(e.data())..docid = e.id)
        .toList();
  }

  Future<String> putMessage(RSubject subject, RMessage message) async {
    var r = await getMessagesCollection(subject).add(message.toMap());
    return r.id;
  }

  Future<RMessage> getMessageFromID(
      String classid, String subid, String id) async {
    var r = await getMessagesCollection(
            RSubject(rclass: RClass(docid: classid))..docid = subid)
        .doc(id)
        .get();
    return RMessage.fromMap(r.data())..docid = r.id;
  }
}
