import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/models/questionmodal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireRepo {
  static final FireRepo instance = FireRepo._internal();
  factory FireRepo() {
    return instance;
  }
  FireRepo._internal();

  final db = FirebaseFirestore.instance;

  RUser currentUser;

  static CollectionReference usersCollection;
  static CollectionReference classesCollection;
  static CollectionReference notificationCollection;
  static CollectionReference examQuestionCollection;

  Future<void> init() {
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

  Future<void> createNewUser(RUser user) async {
    await usersCollection.doc(user.uid).set(user.toMap());
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
      return RUser.fromMap(doc.data());
    } else
      return null;
  }

  Stream<List<RUser>> getAllUsersStream(RUserType type) async* {
    yield* usersCollection.where('type', isEqualTo: type.value).snapshots().map(
        (event) => event.docs.map((e) => RUser.fromMap(e.data())).toList());
  }

  Stream<List<RUser>> getAllStudentsOfClass(RClass rclass) async* {
    yield* usersCollection
        .where('class_access', isEqualTo: rclass.docid)
        .snapshots()
        .map(
            (event) => event.docs.map((e) => RUser.fromMap(e.data())).toList());
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

  //
  //Message
  //

  Future<List<RMessage>> getMessages(RSubject subject) async {
    final snap = await getMessagesCollection(subject).get();
    return snap.docs
        .map((e) => RMessage.fromMap(e.data())..docid = e.id)
        .toList();
  }

  Future<void> putMessage(RSubject subject, RMessage message) async {
    await getMessagesCollection(subject).add(message.toMap());
  }
}
