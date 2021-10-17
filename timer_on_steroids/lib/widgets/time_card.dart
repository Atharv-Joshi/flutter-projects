import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String value;
  final String label;
  const TimeCard({required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.grey,
              letterSpacing: 1
            ),
          ),
        ),
      ],
    );
  }
}
