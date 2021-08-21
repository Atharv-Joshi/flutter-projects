
import 'package:get/get.dart';

class PersonalDetailsController extends GetxController{

  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  updatePD(newName , newEmail , newPassword){
    name.value = newName;
    email.value = newEmail;
    password.value = newPassword;
    // print('name : ${name.value}');
    // print('email : ${email.value}');
    // print('password : ${password.value}');
  }

}