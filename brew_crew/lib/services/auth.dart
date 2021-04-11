import 'package:brew_crew/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/my_user.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _UserFromFireBaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser> get user_stream {
    return _auth.authStateChanges().map(_UserFromFireBaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _UserFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password


// register with email and password

// sign out

Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }

}
}