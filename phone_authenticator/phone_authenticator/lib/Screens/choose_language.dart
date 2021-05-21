import 'package:flutter/material.dart';
import '../Widgets/curve.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  String dropdownValue = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/liveasylogo.png'),
              SizedBox(
                height: 40,
              ),
              Text(
                'Please select your Language',
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 120),
                  child: Text(
                    'You can change the language at any time.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff6A6C7B),
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xff000000),
                        style: BorderStyle.solid,
                        width: 1.5)),
                width: 250,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  isExpanded: true,
                  // elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: SizedBox.shrink(),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['English', 'Marathi', 'Hindi', 'Tamil']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 250,
                height: 50,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: const Color(0xff2E3B62),
                  elevation: 0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/mobilenumber');
                  },
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(children: [
                    ClipPath(
                      clipper: WaveClipperTwo1(reverse: true),
                      child: Container(
                        color: const Color.fromRGBO(147, 210, 243, 1),
                        height: 100,
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipperTwo2(reverse: true),
                      child: Container(
                        color: Color.fromRGBO(46, 59, 98, 0.5),
                        height: 100,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
