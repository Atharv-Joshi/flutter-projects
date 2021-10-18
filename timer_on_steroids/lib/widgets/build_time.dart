import 'package:flutter/material.dart';
import 'package:timer_on_steroids/widgets/time_card.dart';

class BuildTime extends StatelessWidget {

  final Duration duration;
  final bool isCompleted;

  const BuildTime(
      {
        required this.duration,
        required this.isCompleted
      }
      );

  String twoDigits(int n) => n.toString().padLeft(2, '0');


  @override
  Widget build(BuildContext context) {
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(24));
    final days = duration.inDays.toString();
    return isCompleted ? Container(
      margin: const EdgeInsets.all(30),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration:  BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(100)
            ),
            height: 200,
            width: 200,
          ),
          Container(
            decoration:  BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100)
            ),
            height: 180,
            width: 180,
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
      style: const TextStyle(
          color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),
    );
  }
}
