import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';




class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [];

  dynamic args;

  void updateTime(index,locations) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pushNamed(context, '/home',arguments: {'finalTime' : instance.finalTime ,
                                                                'isDaytime': instance.isDaytime ,
                                                                'zoneName' : instance.zoneName} );}

  @override
  void initState() {
    super.initState();
  }

    @override
    Widget build(BuildContext context)  {
        args = ModalRoute.of(context).settings.arguments ;

        var autocontroller = TextEditingController();


        locations = args['locations'];

      return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location'),
          centerTitle: true,


        ),
        body: Column(
          children: [
          //   AutoCompleteTextField(
          // // key : ikey,
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 16,
          //   ),
          //   controller: autocontroller,
          //   clearOnSubmit: false,
          //   itemSubmitted: (item) {
          //     autocontroller.text = item;
          //   },
            
          //   suggestions: locations,
          //   itemBuilder: (context, item) {
          //     return Container(
          //       padding: EdgeInsets.all(10.0),
          //                     child: Row(
          //         children: [Text(item)],
          //       ),
          //     );
          //   },
          //   itemSorter: (a, b) {
          //     return a.toString().compareTo(b.toString());
          //   },
          //   itemFilter: (item, query) {
          //     return item
          //         .toString()
          //         .toLowerCase()
          //         .startsWith(query.toLowerCase());
          //   }),
            ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
                    child: Card(
                      child: ListTile(

                        onTap: (){
                          updateTime(index,locations);
                        },
                        title: Text(
                            locations[index].zoneName

                        ),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/${locations[index].flag}'),
                        ),

                      ),
                    ),
                  );
                }),
          ],
        ),
      );
    }
}




