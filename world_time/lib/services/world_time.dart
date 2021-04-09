import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String flag;
  String zoneName;
  bool isDaytime = true ;
  var finalTime;




  WorldTime({this.flag,this.zoneName});

  Future<void> getTime() async {

    try{

      Response response = await get(Uri.parse('https://api.timezonedb.com/v2.1/get-time-zone?key=9T71J9W5UMLO&format=json&by=zone&zone=$zoneName'));
      Map data = jsonDecode(response.body);
      DateTime time = DateTime.parse(data['formatted']);

      finalTime = DateFormat.Hms().format(time);

      isDaytime = time.hour > 6 && time.hour < 19 ? true : false ;

    }

    catch(e){

      print('error $e');
      finalTime  = "could not get time";

    }

  }

}