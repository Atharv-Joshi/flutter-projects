import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  final double currentStreakInSeconds;
  const Dashboard({Key? key, required this.currentStreakInSeconds}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Timer? timer = Timer(const Duration(seconds: 0), (){});
  Duration durationCompleted =  const Duration();
  Duration durationRemaining = const Duration();
  final secondsIn90Days = 7776000;

  @override
  void initState() {
    super.initState();
    durationCompleted = Duration(seconds: widget.currentStreakInSeconds.toInt());
    durationRemaining = Duration(seconds: secondsIn90Days - widget.currentStreakInSeconds.toInt());
      startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => calculateTime());
  }

  void calculateTime() {
    const addSeconds = 1;
    final secondsCompleted = durationCompleted.inSeconds + addSeconds;
    final secondsRemaining = durationRemaining.inSeconds - addSeconds;
    setState(() {
      durationCompleted = Duration(seconds: secondsCompleted);
      durationRemaining = Duration(seconds: secondsRemaining);
    });

  }

  void setValueInLocalStorage(startTimeInSeconds) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setDouble('startTimeInSeconds', startTimeInSeconds);
  }


  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildTime(durationCompleted),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed:
                        (){
                      timer!.cancel();
                      setState(() {
                        durationCompleted = const Duration();
                        durationRemaining = const Duration(seconds: 7776000);
                        setValueInLocalStorage(DateTime.now().millisecondsSinceEpoch/1000);
                      });
                      startTimer();
                        } ,
                    child: const Text('Relapse')
                ),
                buildTime(durationRemaining),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTime(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(24));
    final days = twoDigits(duration.inDays.remainder(365));
    return Text(
      '$days : $hours : $minutes : $seconds',
    );
  }

}