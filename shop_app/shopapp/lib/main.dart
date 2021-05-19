import 'package:flutter/material.dart';
import 'package:shopapp/Screens/product_details_screen.dart';
import 'package:shopapp/Screens/product_overview_screen.dart';
import 'providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),

        routes: {
          ProductDetailsScreen.routeName : (ctx) => ProductDetailsScreen(),
        },
        home: ProductOverviewScreen()
      ),
    );
  }
}

