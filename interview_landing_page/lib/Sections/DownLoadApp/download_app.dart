import 'package:flutter/material.dart';

class DownloadApp extends StatelessWidget {
  const DownloadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 131, 200, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              'assets/mockup1.png',
          width: MediaQuery.of(context).size.width * 0.6,),
          Column(
            children: [
              Text(
                  'DOWNLOAD THE APP NOW!',
                style: TextStyle(
                  fontSize: 40,
                  
                ),

              ),
              Row(
                children: [
                  IconButton(
                    iconSize: 191,
                      onPressed: (){},
                      icon: Image.asset('assets/appStoreDark.png')),
                  IconButton(
                    iconSize: 247,
                      onPressed: (){},
                      icon: Image.asset('assets/playStoreDark.png'))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
