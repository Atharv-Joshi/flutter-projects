import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title:  Text('DeliMeals'),
      ),
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(
                  id : e.id,
                  title: e.title,
                  color: e.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
