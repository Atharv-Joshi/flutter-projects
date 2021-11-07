import 'package:get/get.dart';

class AuthenticationFormController extends GetxController{
  RxBool isLogin = true.obs;

  updateIsLogIn(bool value){
    isLogin.value = value;
  }
}