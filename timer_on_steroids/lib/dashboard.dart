import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => calculateTime());
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
            buildTime(durationCompleted , true),
            buildTime(durationRemaining , false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
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
                    child: const Text('Relapse')
                ),
              ],
            ),
            documentationTemplate(label: 'Best', value: best, descriptor: 'days'),
            documentationTemplate(label: 'Attempts', value: attempts, descriptor: 'times'),
          ],
        ),
      ),
    );
  }

  Widget buildTime(Duration duration , bool isCompleted){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(24));
    final days = twoDigits(duration.inDays.remainder(365));
    return isCompleted ? Column(
      children: [
        timeCard(value: days, label: 'Days'),
        Row(
          children: [
            timeCard(value: hours, label: 'Hrs'),
            timeCard(value: minutes, label: 'Mins'),
          ],
        ),
        timeCard(value: seconds, label: 'Secs'),
      ],
    ) : Text(
        'ONLY $days Days ${hours}h ${minutes}m ${seconds}s REMAINING'
    );
  }

  Widget documentationTemplate({required label, required value, required descriptor}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Row(
          children: [
            Text(value.toString()),
            Text(descriptor)
          ],
        ),
      ],
    );
  }

  Widget timeCard({required value,required label}){
    return Row(
      children: [
        Text(value),
        Text(label),
      ],
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

  void setValueInLocalStorage(startTimeInSeconds) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setDouble('startTimeInSeconds', startTimeInSeconds);
  }

  void updateBest(days) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if(_preferences.getInt('best') == null || days > _preferences.getInt('best')){
      _preferences.setInt('best', days);
      setState(() {
        best = days;
      });
    }
  }

}