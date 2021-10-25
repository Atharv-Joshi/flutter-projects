import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_on_steroids/widgets/build_time.dart';
import 'package:timer_on_steroids/widgets/confirm_dialog_box.dart';
import 'package:timer_on_steroids/widgets/documentation_template.dart';
import 'package:timer_on_steroids/widgets/custom_drawer.dart';
import 'package:timer_on_steroids/widgets/relapse_button.dart';

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

    ThemeData theme = Theme.of(context);

     relapseFunction () async {
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
      Navigator.pop(context);
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
      Navigator.pop(context);
    }


    Widget dashBoard = MediaQuery.of(context).orientation == Orientation.portrait ?
        //dashboard for potrait ----------------
    Container(
      color: theme.primaryColor,
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .08,vertical: MediaQuery.of(context).size.height * .03),
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
          BuildTime(duration: durationCompleted , isCompleted : true),
          RelapseButton(alertDialog: ConfirmDialogBox(onPressedFunction: relapseFunction,),),
          Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
              child: BuildTime(duration : durationRemaining , isCompleted : false)),
        ],
      ),
    )

    //dashboard for landscape ----------

    : Container(
      color: theme.primaryColor,
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .08,vertical: MediaQuery.of(context).size.height * .0),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                      child: DocumentationTemplate(label: 'Best', value: best, descriptor: 'days')),
                  DocumentationTemplate(label: 'Attempts', value: attempts, descriptor: 'times'),
                ],
              ),
              BuildTime(duration: durationCompleted , isCompleted : true),
            ],
          ),
          Container(
              margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
              child: BuildTime(duration : durationRemaining , isCompleted : false)),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          MediaQuery.of(context).orientation == Orientation.landscape ? RelapseButton(alertDialog: ConfirmDialogBox(onPressedFunction: relapseFunction,)): Container(),
        ],
      ),
      body: MediaQuery.of(context).orientation == Orientation.landscape ? SingleChildScrollView(
        child: dashBoard,
      )
      : dashBoard,
      drawer: CustomDrawer(resetValues: resetValues ,),
    );

  }//build ends

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
    if(currentStreakInSeconds == 0){
      setValueInLocalStorage(DateTime.now().millisecondsSinceEpoch/1000);
    }
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

}