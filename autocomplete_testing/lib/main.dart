import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AutoCompleteTest(),
    );
  }
}

class AutoCompleteTest extends StatefulWidget {
  @override
  _AutoCompleteTestState createState() => _AutoCompleteTestState();
}

class _AutoCompleteTestState extends State<AutoCompleteTest> {
  

  @override
  Widget build(BuildContext context) {

    // GlobalKey<AutoCompleteTextFieldState> ikey  ;

    var autocontroller = TextEditingController();
    List<String> suggestions = [
      'rahul',
      'rohit',
      'akshay',
      'atharv',
      'atharva',
      'sanket',
      'sahil',
      'ninad',
      'keyur',
      'karan',
      'kishor'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('autocomplete test'),
      ),
      body: Column(children: [
        AutoCompleteTextField(
          // key : ikey,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            controller: autocontroller,
            clearOnSubmit: false,
            itemSubmitted: (item) {
              autocontroller.text = item;
            },
            
            suggestions: suggestions,
            itemBuilder: (context, item) {
              return Container(
                padding: EdgeInsets.all(10.0),
                              child: Row(
                  children: [Text(item)],
                ),
              );
            },
            itemSorter: (a, b) {
              return a.toString().compareTo(b.toString());
            },
            itemFilter: (item, query) {
              return item
                  .toString()
                  .toLowerCase()
                  .startsWith(query.toLowerCase());
            }),
      ]),
    );
  }
}
