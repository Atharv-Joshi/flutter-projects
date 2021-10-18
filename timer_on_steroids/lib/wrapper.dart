import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_on_steroids/dashboard.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  double currentStreakInSeconds = 0;
  int best = 0;
  int attempts = 1;

  @override
  void initState() {
    getCurrentStats();
    super.initState();
  }

  void getCurrentStats() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await setInitialValues();
    double? startTimeInSeconds = _preferences.getDouble('startTimeInSeconds');
    double currentTimeInSeconds = (DateTime.now().millisecondsSinceEpoch)/1000;
    if(startTimeInSeconds != 0){
      currentStreakInSeconds = currentTimeInSeconds - startTimeInSeconds!;
    }
    attempts = _preferences.getInt('attempts')!;
    best = _preferences.getInt('best')!;
    print('values in wrapper attempts ');
    Get.off(() =>  Dashboard(currentStreakInSeconds: currentStreakInSeconds, attempts: attempts , best: best,) , duration: const Duration(seconds: 1));
  }

  Future<bool> setInitialValues() async {
    print('set initial values');
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if(_preferences.getInt('attempts') == null){
      print('attempts : ${_preferences.getInt('attempts')}');
      _preferences.setInt('attempts', 1);
    }
    if(_preferences.getDouble('startTimeInSeconds') == null){
      print('startTimeInSeconds : ${_preferences.getDouble('startTimeInSeconds')}');
      _preferences.setDouble('startTimeInSeconds', 0);
    }
    if(_preferences.getInt('best') == null){
      print('best : ${_preferences.getInt('best')}');
      _preferences.setInt('best', 0);
    }

    print('initial attempts : ${_preferences.getInt('attempts')}');
    print('initial best : ${_preferences.getInt('best')}');
    print('initial start time : ${_preferences.getDouble('startTimeInSeconds')}');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.greenAccent,
      ),
    );
  }
}
