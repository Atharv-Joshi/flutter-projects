import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),

      body: Center(
        child: Text('Hello There',
                    style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.grey[600],

        ),),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('Click'),
        backgroundColor: Colors.red[600],
    ),

    ),
  ));
}

