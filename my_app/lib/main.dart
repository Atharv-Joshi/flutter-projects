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
      body: Center(
        child: ElevatedButton.icon(
        onPressed: (){},
        icon: Icon(
          Icons.access_alarm
        ),
        label: Text('alarm'),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
} //home class
