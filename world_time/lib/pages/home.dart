import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;

    String bgImg = data['isDaytime'] ? 'day.png' : 'night.png';


    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
            fit : BoxFit.cover
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Column(

            children: [
              TextButton.icon(
                  onPressed: () async {
                  Navigator.pop(context);
                    setState(() {
                      data = {
                        'finalTime' : data['finalTime'],
                        // 'flag' : result['flag'],
                        'isDaytime' : data['isDaytime'],
                        'zoneName' : data['zoneName'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location ,
                    color: Colors.grey[300],),

                  label: Text(
                      'Edit Location' ,
                    style: TextStyle(
                        color: Colors.grey[300],
                        letterSpacing: 1.0,
                          ),


                  ),
              ),

              SizedBox(height: 30.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['zoneName'],
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.0),

              Text(
                data['finalTime'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
