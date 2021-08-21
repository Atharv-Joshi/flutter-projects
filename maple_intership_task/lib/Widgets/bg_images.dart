import 'package:flutter/material.dart';

class BackGroundImages extends StatelessWidget {

  final manBooks;

  BackGroundImages(
  {
    required this.manBooks,
}
      );



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(
            'assets/images/circles.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          manBooks
          ? Row(
            children: [
              Expanded(child: SizedBox()),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0,
                    85,
                    0,
                    0),
                child: Image.asset(
                  'assets/images/manBooks.png',
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
              ),
            ],
          )
          : SizedBox(),
        ],
      ),
    );
  }
}
