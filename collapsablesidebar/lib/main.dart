import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_avatar.dart';
import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collapsable Sidebar testing'),
      ),
      body: Container(
        child: CollapsibleSidebar(
          title: 'Atharv Joshi',
          avatarImg: NetworkImage('https://images.pexels.com/photos/7479358/pexels-photo-7479358.jpeg'),
          body: Container(
            child: Text('sidebar body'),
          ),
          items: [
            CollapsibleItem(
              icon: IconData(0x41)  ,


              text: 'item1',
              onPressed: () {
                print('hello');
              },
              isSelected: true,
            ),
            CollapsibleItem(
              icon:  IconData(0x41)
              ,
              text: 'item2',
              onPressed: () {
                print('hello2');
              },
              isSelected: false,
            ),
            CollapsibleItem(
              icon:  IconData(0x41),
              text: 'item3',
              onPressed: () {
                print('hello3');
              },
              isSelected: false,
            )
          ],
        ),
      ),
    );
  }
}
