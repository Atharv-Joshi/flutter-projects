import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  DateTime selectedDate;

  String text;

  void _submitData() {
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamount <= 0 || selectedDate == null) {
      return;
    }

    widget.addTx(enteredtitle, enteredamount , selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() async {
    DateTime chosendate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now());
    if (chosendate != null) {

      setState(() => selectedDate = chosendate

      );
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: amountcontroller,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onSubmitted: (_) => _submitData(),
              keyboardType: TextInputType.number,
            ),
            Container(
              height: 70,
              child: Row(
                  children: [
                    Expanded(child: Text(selectedDate != null ? DateFormat().add_yMd().format(selectedDate) : 'No Date chosen')),
                    TextButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        child: Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
            ),
            ElevatedButton(
                onPressed: _submitData, child: Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
