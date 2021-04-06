import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GameRank(),
  ));
}

class GameRank extends StatefulWidget {
  @override
  _GameRankState createState() => _GameRankState();
}

class _GameRankState extends State<GameRank> {

  int counter = 0;
  int count_index = 0;


  List names = ["Rachiron" , "Alphakiller" , "ChronicSeer"];
  List current_ranks = [1,2,3];
  List email_ids = ["dasrachiron@gmail.com" , "rohitjoshi0632@gmail.com" ,"ninaddragon@gmail.com"];
  List images = ["images/pfp-atharv.png" , "images/pfp-rohit.jpg","images/pfp-ninad.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Gamer Rank'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[400],
        elevation: 0.0,
      ),

    body: Padding(
      padding: const EdgeInsets.fromLTRB(30.0,40.0,30.0,0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(images[count_index]),
              radius: 50.0,
            ),
          ),
          Divider(height: 60.0,
            color: Colors.black,),

          Text(
            'NAME',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.deepPurple[100],
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: 10.0,),

          Text(
            '${names[count_index]}',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: 40.0,),

          Text(
            'CURRENT GAMER RANK',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.deepPurple[100],
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: 10.0,),

          Text(
            '${current_ranks[count_index]}',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: 40.0,),

          Row(
            children: [
              Icon(
                Icons.email_sharp,
                color: Colors.deepPurple[50],
              ),

              SizedBox(width: 10.0,),

              Text(
                "${email_ids[count_index]}",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.deepPurple[50],
                  letterSpacing: 1.0,
                ) ,
              ),
            ],
          ),

        ],
      ),
    ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        backgroundColor: Colors.deepPurple[800],
        onPressed: (){
          setState(() {
            counter +=1;
            count_index = counter % 3;
          });
        },
        elevation: 0.5,
      ),
    );
  }
}



