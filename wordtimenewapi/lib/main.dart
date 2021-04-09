import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home : Home(),
  ));
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    gettime();

    return Container();
  }

  void gettime() async {
    Response response = await get(Uri.parse(r'https://api.timezonedb.com/v2.1/get-time-zone?key=9T71J9W5UMLO&format=json&by=zone&zone=Asia/Kolkata'));

    Map data = jsonDecode(response.body);


    DateTime time = DateTime.parse(data['formatted']);

    print(time);

    var format = DateFormat.Hms().format(time);

    print(time.hour);










  }


}

