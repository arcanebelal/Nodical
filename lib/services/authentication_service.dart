import 'package:nodical/services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/nodical_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  NodicalUser _userFromFirebaseUser(User user) {
    return user != null ? NodicalUser(uid: user.uid) : null;
  }

  Stream<NodicalUser> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInEmail({String email, String password}) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future signUpEmail({String email, String password, String name}) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      await DatabaseService(uid: user.uid).updateUserData(name);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future signInGoogle() async {
    try {
      GoogleSignInAccount result = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await result.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential authResult =
          await _firebaseAuth.signInWithCredential(credential);
      User user = authResult.user;

      await DatabaseService(uid: user.uid).updateUserData('new');
    } catch (e) {
      print(e.message);
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
