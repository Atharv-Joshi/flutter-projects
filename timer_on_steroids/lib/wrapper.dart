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
    double? startTimeInSeconds = _preferences.getDouble('startTimeInSeconds');
    if(startTimeInSeconds != null){
      double currentTimeInSeconds = (DateTime.now().millisecondsSinceEpoch)/1000;
      currentStreakInSeconds = currentTimeInSeconds - startTimeInSeconds;
    }
    attempts = _preferences.getInt('attempts') ?? 1;
    best = _preferences.getInt('best') ?? 0;
    Get.off(() =>  Dashboard(currentStreakInSeconds: currentStreakInSeconds, attempts: attempts , best: best,) , duration: const Duration(seconds: 1));
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
