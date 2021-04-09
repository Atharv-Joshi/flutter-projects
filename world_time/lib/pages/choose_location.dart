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

  dynamic args;

  void updateTime(index,locations) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pushNamed(context, '/home',arguments: {'finalTime' : instance.finalTime ,
                                                                'isDaytime': instance.isDaytime ,
                                                                'zoneName' : instance.zoneName} );}

  @override
  void initState() {
    super.initState();
  }

    @override
    Widget build(BuildContext context)  {
        args = ModalRoute.of(context).settings.arguments ;


        locations = args['locations'];

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

                    onTap: (){
                      updateTime(index,locations);
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




