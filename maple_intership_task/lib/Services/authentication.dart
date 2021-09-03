import 'package:firebase_auth/firebase_auth.dart';
import 'package:maple_intership_task/Controllers/personal_details_controller.dart';
import 'package:get/get.dart';

class Authentication{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  PersonalDetailsController _detailsController = Get.put(PersonalDetailsController());

  // register with email and password
  Future registerEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // print('current user ${_auth.currentUser}');
      // print('in auth name ${_detailsController.name.value}');
      // _auth.currentUser!.updateDisplayName(_detailsController.name.value);
      return user;
    } catch (e) {
      return e.toString();
    }
  }

  //login in with email and password
Future loginEmailAndPassword(String email , String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      return user;
    }
    catch(e){
      return e.toString();
    }
}

}