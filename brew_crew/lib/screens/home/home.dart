import 'package:brew_crew/screens/home/settings_panel.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brew.dart';
import 'BrewList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    void _invokeSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brewSnapshot,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Brew Crew'),
          actions: <Widget>[
            TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(
                  Icons.logout, 
                  color: Colors.black,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            TextButton.icon(
                onPressed: () => _invokeSettingsPanel(),
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: Text(
                  'Settings',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover
            ),
          ),
          child: BrewList()),
      ),
    );
  }
}
