import 'package:flutter/material.dart';

enum Profiles { Shipper, Transporter }

class ProfileSelection extends StatefulWidget {
  @override
  _ProfileSelectionState createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  Profiles? _profile  = Profiles.Shipper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Text(
                  
                  'Please select your Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 40, 20, 30),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.5)),
                child: Row(
                  children: [
                    Radio<Profiles>(
                      activeColor: const Color(0xff2E3B62),
                        value: Profiles.Shipper,
                        groupValue: _profile,
                        onChanged: (value) {
                          setState(() {
                            _profile = value;
                          });
                          
                        }),
                    Icon(
                      Icons.house_siding_sharp,
                      size: 40,),
                    SizedBox(width: 12,),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipper',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                            ),
                            SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: Text(
                              ' Lorem ipsum dolor sit amet, consectetur',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
),
                          )
                          
                        ],
                      ),
                    )

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.5)),
                child: Row(
                  children: [
                    Radio<Profiles>(
                        activeColor: const Color(0xff2E3B62),
                        value: Profiles.Transporter,
                        groupValue: _profile,
                        onChanged: (value) {
                          setState(() {
                            _profile = value;
                          });
                        }),
                    Icon(
                      Icons.train_sharp,
                      size: 40,),
                    SizedBox(width: 12,),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transporter',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                            ),
                            SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: Text(
                              ' Lorem ipsum dolor sit amet, consectetur',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
),
                          )
                          
                        ],
                      ),
                    )

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: double.infinity,
                height: 50,
                // ignore: deprecated_member_use
                child: RaisedButton(
        
        color: const Color(0xff2E3B62),
        elevation: 0,
        onPressed: () {},
        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                ),
        child: Text(
          'CONTINUE',
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 20,
            color: const Color(0xffFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
