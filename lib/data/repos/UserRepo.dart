import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepo {
  final FirebaseAuth _auth;
  //final GoogleSignIn _gauth;

  UserRepo() : _auth = FirebaseAuth.instance;
  //_gauth = GoogleSignIn();

  Future<bool> isLoggedIn() async {
    String uid = FireRepo.instance.saveBox.get('useruid');
    if (uid == null) {
      return false;
    }
    var ruser = await FireRepo.instance.getRUserFromUID(uid);
    if (ruser != null) {
      FireRepo.instance.currentUser = ruser;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> initUserRepo() async {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return await _logInWithEmail('bkdschool@bkd.com', 'bkdschool');
    }
  }

  Future<bool> logInWithUsername(String username, String password) async {
    var ruser =
        await FireRepo.instance.validateUserLoginInfo(username, password);
    if (ruser != null) {
      await initUser(ruser);
      return true;
    } else {
      return false;
    }
  }

  Future<void> initUser(RUser ruser) async {
    FireRepo.instance.currentUser = ruser;
    await FireRepo.instance.saveBox.put('useruid', ruser.uid);
    if (ruser.type == RUserType.STUDENT) {
      ChatRepo.instance.subscribe(classID: ruser.classaccess);
      await ChatRepo.instance.clearAndLoadAllMessages(ruser.classaccess);
    } else if (ruser.type == RUserType.TEACHER) {
      var r = await FireRepo.instance.getClassesList();
      for (var rclass in r) {
        ChatRepo.instance.subscribe(classID: rclass.docid);
        await ChatRepo.instance.clearAndLoadAllMessages(rclass.docid);
      }
    }
  }

  // static Future<bool> signUpWithUsername(RUser ruser, String password) async {
  //   final u = await _signUpWithEmail(ruser.username + '@bkd.com', password);
  //   if (u != null) {
  //     await FireRepo.instance.createNewUser(ruser..uid = u.uid);
  //   }
  //   return u != null;
  // }

  Future<bool> _logInWithEmail(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
      throw Exception(e.toString());
    });
    final user = getFirebaseUser();
    return user != null;
  }

  // static Future<User> _signUpWithEmail(String email, String password) async {
  //   FirebaseApp tapp = await Firebase.initializeApp(
  //       name: 'Secondary', options: Firebase.app().options);
  //   final creds = await FirebaseAuth.instanceFor(app: tapp)
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .catchError((e) {});
  //   await tapp.delete();
  //   return creds.user;
  // }
  // Future<bool> logInWithGoogle() async {
  //   final gaccount = await _gauth.signIn();
  //   if (gaccount != null) {
  //     final gauthentication = await gaccount.authentication;
  //     final creds = GoogleAuthProvider.credential(
  //         accessToken: gauthentication.accessToken,
  //         idToken: gauthentication.idToken);
  //     await _auth
  //         .signInWithCredential(creds)
  //         .catchError((e) => throw Exception(e.toString()));
  //     final user = getUser();
  //     return user != null;
  //   } else
  //     throw Exception("Google Sign in failed");
  // }
  // Future<bool> logInWithAnony() async {
  //   await _auth
  //       .signInAnonymously()
  //       .catchError((e) => throw Exception(e.toString()));
  //   final user = getUser();
  //   return user != null;
  // }
  Future<void> signOut() async {
    ChatRepo.instance.unsubscribe(classID: getUser().classaccess);
    FireRepo.instance.currentUser = null;
    FireRepo.instance.saveBox.delete('useruid');
  }

//
//
//
//
//
//

  User getFirebaseUser() {
    return _auth.currentUser;
  }

  RUser getUser() {
    return FireRepo.instance.currentUser;
  }

  bool isAdminUser() {
    RUser user = getUser();
    return user.type == RUserType.ADMIN;
  }
}
