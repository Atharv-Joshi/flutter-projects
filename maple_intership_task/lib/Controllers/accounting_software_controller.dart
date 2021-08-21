
import 'package:get/get.dart';

class AccountingSoftwareController extends GetxController{

  RxString aSoft = ''.obs;

  updateASoft(newASoft){
    aSoft.value = newASoft;
  }

}