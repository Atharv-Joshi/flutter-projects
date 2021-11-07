import 'package:flutter/material.dart';

class GettingStartedInfoTemplate extends StatelessWidget {

  final String image;
  final String title;
  final String description;
  final String buttonTitle;
  final Function onPressed;

  GettingStartedInfoTemplate(
  {
    required this.image,
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.onPressed
}
      );



  @override
  Widget build(BuildContext context) {



    return Container(
      child: Column(
        children: [
          Image.asset(image , height: 100,),
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: SelectableText(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              )
          ) ,
          Container(
            width: 200,
            margin: EdgeInsets.only(bottom: 10),
              child: SelectableText(
                  description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
          ),
          TextButton(
              onPressed: (){onPressed;},
              child: Row(
                children: [
                  Text(
                    buttonTitle,
                    style: TextStyle(
                      fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
