import 'package:flutter/material.dart';

class PartyMasterTile extends StatelessWidget {
  final logo;
  final title;

  PartyMasterTile(
  {
    required this.logo,
    required this.title
}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Image.asset(
              logo,
              height: 73,
              width: 73,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff000000).withOpacity(0.23),
                  fontWeight: FontWeight.w700
              ),),
          )
        ],
      ),
    );
  }
}
