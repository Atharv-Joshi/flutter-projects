import 'package:flutter/material.dart';

class CookCard extends StatelessWidget {
  const CookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 75,
            color: Colors.grey,
          ),
          Text(
              'Cook Name',
          ),
          Text(
            'Rating',
          )
        ],
      ),
    );
  }
}
