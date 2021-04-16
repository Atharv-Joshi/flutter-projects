import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction( id: 't1' , title: 'new shoes' , amount: 69.99 , date: DateTime.now()),
    Transaction( id: 't2' , title: 'groceries' , amount: 12.96 , date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Personal Expenses')),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Charts'),
            ),
          ),
          Column(
            children: transactions.map((e) => Card(
              child: Row(
            children: [Container(

              child: Text(
                e.amount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple
                ),
                
                ), 
              margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.black , width: 2)
              ),
              padding: EdgeInsets.all(10),

              ) ,
            Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    
                    ),
                  Text(e.date.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),)
              ],
              )
            ],
            )
            )
            ).toList(),
          )
        ],
      ),
    );
  }
}
