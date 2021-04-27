import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categorymealsscreen';
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: Center(
        child: Text('Category Meals  Screen'),
      ),
    );
  }
}
