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
  int attempts = 1;
  int best = 0;
  double currentStreakInSeconds = 0;

  @override
  void initState() {
    super.initState();
    setValues();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .08,vertical: MediaQuery.of(context).size.height * .08),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DocumentationTemplate(label: 'Best', value: best, descriptor: 'days'),
                DocumentationTemplate(label: 'Attempts', value: attempts, descriptor: 'times'),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11),
                child: BuildTime(duration: durationCompleted , isCompleted : true)),
            IconButton(
              iconSize: 50,
              tooltip: 'Relapse',
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
                _preferences.setInt('attempts', attempts);
              } ,
              icon: Image.asset(
                'assets/images/relapse.png',
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.09),
                child: BuildTime(duration : durationRemaining , isCompleted : false)),
          ],
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            color: Colors.black87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: (){
                      resetValues();
                    },
                    child:  Row(
                      children: const [
                        Icon(
                            Icons.delete,
                          color: Colors.greenAccent,
                        ),
                        Text(
                            'Reset All',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 1
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),

      drawerScrimColor: Colors.black,
    );
  }

  void calculateCurrentStreak() {
    const addSeconds = 1;
    final secondsCompleted = durationCompleted.inSeconds + addSeconds;
    final secondsRemaining = durationRemaining.inSeconds - addSeconds;
    setState(() {
      durationCompleted = Duration(seconds: secondsCompleted);
      durationRemaining = Duration(seconds: secondsRemaining);
    });
    final days = durationCompleted.inDays;
    updateBest(days);
  }

  void setValues(){
    currentStreakInSeconds= widget.currentStreakInSeconds;
    durationCompleted = Duration(seconds: currentStreakInSeconds.toInt());
    attempts = widget.attempts;
    best = widget.best;
    durationRemaining = Duration(seconds: secondsIn90Days - currentStreakInSeconds.toInt());
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => calculateCurrentStreak());
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

  void resetValues() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('attempts', 1);
    prefs.setInt('best', 0);
    prefs.setDouble('startTimeInSeconds', 0);
    setState(() {
      attempts = prefs.getInt('attempts')!;
      best = prefs.getInt('best')!;
      durationCompleted = const Duration();
      durationRemaining = Duration(seconds: secondsIn90Days);
    });
  }
}