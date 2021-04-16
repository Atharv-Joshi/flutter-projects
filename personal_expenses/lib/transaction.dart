import 'package:flutter/foundation.dart'; //for @required

class Transaction {

  //variables
  
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  //constructor
  Transaction({ @required this.id, @required this.amount, @required this.title, @required this.date});

}
