import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin' , url: 'Asia/Seoul', flag :'germany.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home' , arguments: {
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDaytime' : instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.black,
          size: 30.0,
        ),
      ),
    );
  }

}
