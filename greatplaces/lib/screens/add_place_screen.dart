import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/widgets/location_input.dart';
import 'package:provider/provider.dart';

import 'package:greatplaces/widgets/image_input.dart';
import 'package:greatplaces/providers/great_places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  TextEditingController _titleController = TextEditingController();
  File?  _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage == null){
      return;
    }
    Provider.of<GreatPlaces>(context , listen: false).addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title'
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(_selectImage),
                  SizedBox(
                    height: 10,
                  ),
                  LocationInput()
                ],
              ),
            ),

          )),
          RaisedButton.icon(
            label: Text('Add Place'),
            icon: Icon(Icons.add),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
