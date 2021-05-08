import 'package:flutter/material.dart';

class MealsDetails extends StatelessWidget {
  static const String routeName = '/meals-details';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: Text('meal details page'),
        ),
        body: Center(
          child: Text(data)));
  }
}
