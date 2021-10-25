import 'package:flutter/material.dart';

class ConfirmDialogBox extends StatelessWidget {
  final onPressedFunction;
  const ConfirmDialogBox({Key? key , required this.onPressedFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      title:  const Text("Confirm ?"),
      titleTextStyle: theme.dialogTheme.titleTextStyle,
      backgroundColor: theme.dialogTheme.backgroundColor,
      elevation: theme.dialogTheme.elevation,
      titlePadding: const EdgeInsets.fromLTRB(100,20,24,20),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: onPressedFunction,
          child:  Text('yes' , style: theme.dialogTheme.contentTextStyle, ),
          style:  ButtonStyle(
              side: MaterialStateProperty.all(
                  BorderSide(
                      color: theme.dialogTheme.contentTextStyle!.color!
                  ))
          ),
        )
      ],
    );
  }
}
