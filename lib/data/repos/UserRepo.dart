import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepo {
  final FirebaseAuth _auth;
  final GoogleSignIn _gauth;

  UserRepo()
      : _auth = FirebaseAuth.instance,
        _gauth = GoogleSignIn();

  Future<bool> isLoggedIn() async {
    return _auth.currentUser != null;
  }

  Future<bool> logInWithUsername(String username, String password) async {
    final b = await _logInWithEmail(username + '@bkd.com', password);
    return b;
  }

  Future<bool> signUpWithUsername(RUser ruser, String password) async {
    final b = await _signUpWithEmail(ruser.username + '@bkd.com', password);
    if (b) {
      await FireRepo.instance.createNewUser(ruser);
    }
    return b;
  }

  Future<bool> _logInWithEmail(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
      throw Exception(e.toString());
    });
    final user = getUser();
    return user != null;
  }

  Future<bool> _signUpWithEmail(String email, String password) async {
    final creds = await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
      throw Exception(e.toString());
    });
    return creds.user != null;
  }

  Future<bool> logInWithGoogle() async {
    final gaccount = await _gauth.signIn();
    if (gaccount != null) {
      final gauthentication = await gaccount.authentication;
      final creds = GoogleAuthProvider.credential(
          accessToken: gauthentication.accessToken,
          idToken: gauthentication.idToken);
      await _auth
          .signInWithCredential(creds)
          .catchError((e) => throw Exception(e.toString()));
      final user = getUser();
      return user != null;
    } else
      throw Exception("Google Sign in failed");
  }

  Future<bool> logInWithAnony() async {
    await _auth
        .signInAnonymously()
        .catchError((e) => throw Exception(e.toString()));
    final user = getUser();
    return user != null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _gauth.signOut();
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

  Future<RUser> getUser() async {
    return await FireRepo.instance.getRUserFromUID(getFirebaseUser().uid);
  }

  Future<bool> isAdminUser() async {
    RUser user = await getUser();
    return user.type == RUserType.ADMIN;
  }
}
