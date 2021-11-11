import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localbitz/widgets/cards/cook_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.fromLTRB(10,10,20,10),
          child: SelectableText(
            'LocalBitz',
            textAlign: TextAlign.center,
            style: GoogleFonts.dosis(
                letterSpacing: 2,
                textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                )
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, MediaQuery.of(context).size.width * 0.3, 10),
            width: MediaQuery.of(context).size.width * 0.17,
            height: MediaQuery.of(context).size.height * 0.06,
            color: Colors.greenAccent,
            child: Text(
              'Address sqwerrttyu dfsdfsdf ytryrty hj yyyyyyyyyyy yyyyyyyyy',
              textAlign: TextAlign.left,
              maxLines: 1,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: TextButton(onPressed: (){}, child: Text('Search', style: TextStyle(color: Colors.black),))),
          Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: TextButton(onPressed: (){}, child: Text('Cart', style: TextStyle(color: Colors.black),))),
          Container(
              margin: EdgeInsets.fromLTRB(10,10,50,10),
              child: IconButton(

                  onPressed: (){},
                  icon: Icon(Icons.person , color: Colors.grey,
                  ),
                iconSize: 20,
                splashRadius: 20,
              )
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Column(
        children: [
          Text(
            'Cooks'
          ),
          Expanded(
            child: Container(
              height: 200,
              child: GridView.count(
                  crossAxisCount: 4,
                children: List.generate(20, (index) => CookCard()),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
