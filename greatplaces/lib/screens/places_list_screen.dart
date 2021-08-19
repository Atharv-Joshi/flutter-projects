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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context).fetchAndSetPlaces(),
        builder: (ctx,snapshot) =>
          //   snapshot.connectionState == ConnectionState.waiting
          // ? Center(
          //     child: CircularProgressIndicator(),
          //   )
          //   :
            Consumer<GreatPlaces>(
                builder: (ctx,greatPlaces,ch) =>
                greatPlaces.items.length <= 0 ? Center(
                  child: CircularProgressIndicator(),
                )
                :
                    ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (context , index) =>
                //               greatPlaces.items.length <= 0
                //               ?
                // Center(child: const Text('Got no places yet , start adding some!'))
                //               :
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: FileImage(greatPlaces.items[index].image),
                                  // radius: 50,
                                ),
                                title: Text(greatPlaces.items[index].title),
                              )
                // ),
            ),
      ),
      )
    );
  }
}
