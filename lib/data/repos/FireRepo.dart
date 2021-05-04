import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireRepo {
  static final FireRepo instance = FireRepo._internal();
  factory FireRepo() {
    return instance;
  }
  FireRepo._internal();

  final db = FirebaseFirestore.instance;

  static CollectionReference usersCollection;
  static CollectionReference classesCollection;

  Future<void> init() {
    usersCollection = db.collection('users');
    classesCollection = db.collection('classes');
  }

  static CollectionReference getSubjectsCollection(RClass rclass) =>
      classesCollection.doc(rclass.docid).collection('subjects');
  static CollectionReference getMessagesCollection(RSubject subject) =>
      getSubjectsCollection(subject.rclass)
          .doc(subject.docid)
          .collection('messages');
  //
  //
  //Main Functions
  //

  Future<void> createNewUser(RUser user) async {
    await usersCollection.doc(user.uid).set(user.toMap());
  }

  Future<RUser> getRUserFromUID(String uid) async {
    final doc = await usersCollection.doc(uid).get();
    if (doc.exists) {
      return RUser.fromMap(doc.data());
    } else
      return null;
  }

  //
  //
  //
  Future<List<RClass>> getClassesList() async {
    final snap = await classesCollection.get();
    return snap.docs
        .map((e) => RClass.fromMap(e.data())..docid = e.id)
        .toList();
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
