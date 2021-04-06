import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home_page(),
    ));

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Row(
        children: [Container(
          padding: EdgeInsets.all(30),
          color: Colors.cyan,
          child: Text('1'),
        ),
          Container(
            padding: EdgeInsets.all(30),
            color: Colors.pink,
            child: Text('2'),
          ),
          Container(
            padding: EdgeInsets.all(30),
            color: Colors.green,
            child: Text('3'),
          )],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
} //home class
