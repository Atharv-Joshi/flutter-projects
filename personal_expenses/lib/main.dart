import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Personal Expenses')),
      ),
      body: SingleChildScrollView(
              child: Column(
            children: [
              Container(
        color: Colors.red,
        width: double.infinity,
        child: Card(
          child: Text(
            'Charts',
          ),
        ),
              ),
              UserTransaction()
            ],
          ),
      ),
    );
  }
}
