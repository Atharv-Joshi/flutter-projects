import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_on_steroids/widgets/build_time.dart';
import 'package:timer_on_steroids/widgets/documentation_template.dart';

class Dashboard extends StatefulWidget {
  final double currentStreakInSeconds;
  final int best;
  final int attempts;
  const Dashboard({Key? key, required this.currentStreakInSeconds , required this.attempts , required this.best}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Timer? timer = Timer(const Duration(seconds: 0), (){});
  Duration durationCompleted =  const Duration();
  Duration durationRemaining = const Duration();
  final secondsIn90Days = 7776000;
  int? attempts;
  int best = 0;

  @override
  void initState() {
    super.initState();
    durationCompleted = Duration(seconds: widget.currentStreakInSeconds.toInt());
    attempts = widget.attempts;
    best = widget.best;
    durationRemaining = Duration(seconds: secondsIn90Days - widget.currentStreakInSeconds.toInt());
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DocumentationTemplate(label: 'Best', value: best, descriptor: 'days'),
                DocumentationTemplate(label: 'Attempts', value: attempts, descriptor: 'times'),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
                child: BuildTime(duration: durationCompleted , isCompleted : true)),
            Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.16),
                child: BuildTime(duration : durationRemaining , isCompleted : false)),
            IconButton(
                onPressed:
                    () async {
                  timer!.cancel();
                  SharedPreferences _preferences = await SharedPreferences.getInstance();
                  setState(() {
                    attempts = _preferences.getInt('attempts')! + 1;
                    durationCompleted = const Duration();
                    durationRemaining = const Duration(seconds: 7776000);
                    setValueInLocalStorage(DateTime.now().millisecondsSinceEpoch/1000);
                  });
                  startTimer();
                  _preferences.setInt('attempts', attempts!);
                } ,
                icon: Image.asset(
                    'assets/images/relapse.png',
                  height: 200,
                  width: 100,
                ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateTime() {
    const addSeconds = 1;
    final secondsCompleted = durationCompleted.inSeconds + addSeconds;
    final secondsRemaining = durationRemaining.inSeconds - addSeconds;
    setState(() {
      durationCompleted = Duration(seconds: secondsCompleted);
      durationRemaining = Duration(seconds: secondsRemaining);
    });
    final days = durationCompleted.inDays.remainder(365);
    updateBest(days);
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => calculateTime());
  }

  void setValueInLocalStorage(startTimeInSeconds) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setDouble('startTimeInSeconds', startTimeInSeconds);
  }

  void updateBest(days) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if(days > _preferences.getInt('best')){
      _preferences.setInt('best', days);
      setState(() {
        best = days;
      });
    }
  }
}