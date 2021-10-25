import 'package:flutter/material.dart';

class RelapseButton extends StatelessWidget {
  final Widget alertDialog;
   const RelapseButton({Key? key , required this.alertDialog}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    getConfirmDialog(){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        },
      );
    }

    return IconButton(
      iconSize: 50,
      tooltip: 'Relapse',
      onPressed: getConfirmDialog,
      icon: Image.asset(
        'assets/images/relapse.png',
      ),
    );
  }
}
