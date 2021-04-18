import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
      ?Column(
        children: [
          Text(
            'No Transactions added yet!',
            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.purple[800]),
            ),

          SizedBox(height: 20,),
          
          Container(child: Image.asset(
            'assets/images/waiting.png' , fit: BoxFit.cover,),
            height: 450,
            )
        ],
      ):ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) => Card(
                  child:  Row(
                children: [
                Container(
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        padding: EdgeInsets.all(10),
                      ),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          DateFormat().add_yMMMd().format(transactions[index].date),
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        
                        
                        
                      ],
                    )
                ],
              ),
                  
              )
              ),
    );
  }
}
