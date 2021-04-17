import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              // onChanged: (value) {
              //   titleinput = value;
              // },
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: amountcontroller,
              // onChanged: (value) {
              //   amountinput = value;
              // },
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextButton(
                onPressed: () {
                  addTx(
                    titlecontroller.text,
                    double.parse(amountcontroller.text));
                },
                child: Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
