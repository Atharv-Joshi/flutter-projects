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
  Duration duration =  const Duration();

  @override
  void initState() {
    super.initState();
    duration = Duration(seconds: widget.currentStreakInSeconds.toInt());
      startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTime());
  }

  void addTime() {
    const addSeconds = 1;
    final seconds = duration.inSeconds + addSeconds;
    setState(() {
      duration = Duration(seconds: seconds);
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
            buildTime(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed:
                        (){
                      timer!.cancel();
                      setState(() {
                        duration = const Duration();
                        setValueInLocalStorage(DateTime.now().millisecondsSinceEpoch/1000);
                      });
                      startTimer();
                        } ,
                    child: const Text('Relapse'))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTime(){
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