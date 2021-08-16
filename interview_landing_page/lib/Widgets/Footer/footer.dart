import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Image.asset('assets/instagram.png')),
              IconButton(onPressed: (){}, icon: Image.asset('assets/facebook-circular-logo.png')),
              IconButton(onPressed: (){}, icon: Image.asset('assets/twitter.png')),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal:37 ),
                  child: TextButton(onPressed: (){}, child: Text('HOME' , style: TextStyle(color: Colors.black , fontSize: 17),))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal:37 ),
                  child: TextButton(onPressed: (){}, child: Text('ABOUT' , style: TextStyle(color: Colors.black , fontSize: 17),))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal:37 ),
                  child: TextButton(onPressed: (){}, child: Text('DOWNLOAD THE APP' , style: TextStyle(color: Colors.black , fontSize: 17),))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal:37 ),
                  child: TextButton(onPressed: (){}, child: Text('CONTACT' , style: TextStyle(color: Colors.black , fontSize: 17),))),
            ],
          ),
          Container(
            color: Colors.black,
            height: 93,
            width: 93,
            child: Image.asset('assets/upArrow.png'),
          ),
        ],
      ),
    );
  }
}
