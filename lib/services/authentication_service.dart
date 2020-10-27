import '../models/nodical_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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

  Future signUpEmail({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
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
