import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<WorldTime> locations = [];

  void timeZoneList() async  {
    Response response1 = await get(Uri.parse('https://api.timezonedb.com/v2.1/list-time-zone?key=9T71J9W5UMLO&format=json&by=zone'));
    dynamic jsonMap = jsonDecode(response1.body);

    List timeZoneList = jsonMap['zones'];

    for(int i = 0 ;  i < timeZoneList.length ; i++){
      locations.add(WorldTime(flag: 'comingsoon.png' , zoneName: timeZoneList[i]['zoneName']));

      Navigator.pushReplacementNamed(context, '/location' , arguments: {
            'locations' : locations
          });
    }
  }

  @override
  void initState() {
    super.initState();
    timeZoneList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
        child: Center(
          child: Column(
            children: [SpinKitThreeBounce(
              color: Colors.black,
              size: 30.0,
            ),
            Text('loading...')],
          )
        ),
      ),
    );
  }
}







