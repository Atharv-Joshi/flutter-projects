import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categorymealsscreen';
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context).settings.arguments;
    final categoryId = data['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(data['title']),
        ),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, index) {
              return (Text(categoryMeals[index].title));
            }));
  }
}
