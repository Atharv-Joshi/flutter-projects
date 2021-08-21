
import 'package:get/get.dart';

class ChannelsController extends GetxController{

  RxString channel = ''.obs;

  updateChannel(newChannel){
    channel.value = newChannel;
  }

}