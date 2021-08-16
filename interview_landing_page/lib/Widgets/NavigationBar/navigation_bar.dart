import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 55, 80, 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: Image.asset('assets/Menu.png')),
          Row(
            children: [
              Image.asset(
                  'assets/logo.png',
                  height: 30,
                  width: 30,),
              SizedBox(width: 15,),
              Text(
                  'DOMINEUM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
          Image.asset(
              'assets/getStarted.png',
          height: 39,
          width: 178,)
        ],
      ),
    );
  }
}
