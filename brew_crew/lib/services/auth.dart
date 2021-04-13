import 'package:brew_crew/models/my_user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFireBaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser> get userStream {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password

  Future signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      print(e.toString());
      return null;
    }
  }

// register with email and password

  Future registerEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new crew member', 100);
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      print('in auth.dart berfore return null');
      return null;
    }
  }

// sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
