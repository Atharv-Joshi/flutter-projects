import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String image;

  ProfileCard(
      {
        required this.image,
        required this.title
      }
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 698,
      width: 444,
      margin: EdgeInsets.symmetric(horizontal: 54),
      child: Card(
        elevation: 10,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 72 , horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(image),
              Text(
                  title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 1
              ),),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          'Lorem ipsum dolor sit amet',
                      style: TextStyle(
                        fontWeight: FontWeight.w600
                      ),)
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),)
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),)
                  ),
                ],
              ),
              SizedBox(height: 83,),
              TextButton(
                  onPressed: (){},
                  child: Text(
                      'Join As',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 80 , vertical: 18)),
                      backgroundColor: MaterialStateProperty.all(Color(0xff1D1D1D),
                      )
                  ),)

            ],
          ),
        ),
      ),
    );
  }
}
