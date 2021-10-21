import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:timer_on_steroids/widgets/time_card.dart';

import 'dynamic_circular_widget.dart';

class BuildTime extends StatefulWidget {

  final Duration duration;
  final bool isCompleted;

  const BuildTime(
      {
        required this.duration,
        required this.isCompleted
      }
      );

  @override
  State<BuildTime> createState() => _BuildTimeState();
}

class _BuildTimeState extends State<BuildTime> with SingleTickerProviderStateMixin {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  double percentValue = 0.0;
  double newPercentage = 0.0;
  AnimationController? _percentValueAnimationController;
  double height = 0;
  double width = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      percentValue = 0.0;
    });
    _percentValueAnimationController = AnimationController(
        vsync: this,
        duration:  const Duration(seconds: 1)
    )
      ..addListener((){
        setState(() {
          percentValue =lerpDouble(percentValue,newPercentage,_percentValueAnimationController!.value)!;

        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final minutes = twoDigits(widget.duration.inMinutes.remainder(60));
    final seconds = twoDigits(widget.duration.inSeconds.remainder(60));
    final hours = twoDigits(widget.duration.inHours.remainder(24));
    final days = widget.duration.inDays.toString();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    setState(() {
      percentValue = newPercentage;
      newPercentage = widget.duration.inSeconds/77760;
      _percentValueAnimationController!.forward(from: 0.0);
    });
    return widget.isCompleted ? Container(
      margin: const EdgeInsets.all(30),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            child: DynamicRingWidget.buildRingAnimation(
              height: height/2,
              width: width/2,
              percentValue: percentValue,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimeCard(value: days, label: 'Days'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimeCard(value: hours, label: 'Hrs'),
                  TimeCard(value: minutes, label: 'Mins'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimeCard(value: seconds, label: 'Secs'),
                ],
              ),
            ],
          ),
        ],
      ),
    ) : Text(
      'ONLY $days Days ${hours}h ${minutes}m ${seconds}s REMAINING',
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyText2,
    );
  }
}
