import 'package:flutter/material.dart';
import 'package:maple_intership_task/Widgets/Buttons/connect_button.dart';

class ChannelTile extends StatelessWidget {
  final logo;
  final title;


  ChannelTile(
  {
    required this.logo,
    required this.title,
}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black , width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(logo),
          ConnectButton(title : title),
        ],
      ),
    );
  }
}
