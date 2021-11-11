import 'package:flutter/material.dart';

class GettingStartedInfoTemplate extends StatefulWidget {

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
  State<GettingStartedInfoTemplate> createState() => _GettingStartedInfoTemplateState();
}

class _GettingStartedInfoTemplateState extends State<GettingStartedInfoTemplate> {
  bool isHovering = false;
  double buttonTextSize = 16;
  Color? buttonTextColor = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {



    return Container(
      child: Column(
        children: [
          Image.asset(widget.image , height: 100,),
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: SelectableText(
                widget.title,
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
                  widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
          ),
          MouseRegion(
            onEnter: (value){
              setState(() {
                buttonTextSize = 18;
                buttonTextColor = Colors.red;
              });
            },
            onExit: (value){
              setState(() {
                buttonTextSize = 16;
                buttonTextColor = Colors.deepOrange;
              });
            },
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: (){widget.onPressed;},
              child: Row(
                children: [
                  AnimatedDefaultTextStyle(
                      child: Text(widget.buttonTitle),
                      style: TextStyle(
                          fontSize: buttonTextSize,
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold
                      ),
                      duration: Duration(microseconds: 1000)

                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Colors.deepOrange,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
