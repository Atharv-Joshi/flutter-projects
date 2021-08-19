import 'package:flutter/material.dart';
import 'package:greatplaces/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import 'package:greatplaces/providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GreatPlaces greatPlaces = Provider.of<GreatPlaces>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: greatPlaces.items.length,
          itemBuilder: (context , index) =>
                        greatPlaces.items.length <= 0
                        ? const Text('Got no places yet , start adding some!')
                        :
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(greatPlaces.items[index].image),
                          ),
                          title: Text(greatPlaces.items[index].title),
                        )),
    );
  }
}
