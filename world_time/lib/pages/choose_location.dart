import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

import 'dart:convert';
import 'package:http/http.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [];


  Future<List> timeZoneList() async  {
    Response response1 = await get(Uri.parse('https://api.timezonedb.com/v2.1/list-time-zone?key=9T71J9W5UMLO&format=json&by=zone'));
    dynamic jsonMap = jsonDecode(response1.body);

    List timeZoneList = jsonMap['zones'];

     for(int i = 0 ;  i < timeZoneList.length ; i++){
      locations.add(WorldTime(flag: 'germany.png' , zoneName: timeZoneList[i]['zoneName']));
    }

    return locations;

  }




  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'zoneName' : instance.zoneName,
      'finalTime' : instance.finalTime,
      'flag' : instance.flag,
      'isDaytime' : instance.isDaytime
    });

}





  @override
  void initState() {
    super.initState();
  }

    // void placeholder() async {
    //   locations = await timeZoneList();
    //   print('in placeholder');
    //   print(locations);
    //
    //
    // }

    @override
    Widget build(BuildContext context)  {

       timeZoneList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location'),
          centerTitle: true,


        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    // tileColor: Colors.grey[400],
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(
                        locations[index].zoneName

                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),

                  ),
                ),
              );
            }),
      );
    }
}




