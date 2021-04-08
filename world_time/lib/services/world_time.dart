import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime = true ;

  WorldTime({this.flag,this.location,this.url});

  Future<void> getTime() async {

    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String OffsetHours = data['utc_offset'].substring(1,3);
      String OffsetMinutes = data['utc_offset'].substring(4,6);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(OffsetHours) , minutes: int.parse(OffsetMinutes)));


      isDaytime = now.hour > 6 && now.hour < 19 ? true : false ;
      time = DateFormat.jm().format(now);



    }

    catch(e){
      print('error $e');
      time = "could not get time";
    }



  }

}