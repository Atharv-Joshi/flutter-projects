
import 'package:get/get.dart';

class UIDController extends GetxController{
  RxString uid = ''.obs;

  updateUID(value){
    uid.value = value;
    // print('in controller ${uid.value}');
  }
}