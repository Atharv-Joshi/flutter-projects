import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl ;

  //get location function
  Future<void> _getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData.latitude);
    print(_locationData.longitude);

  }//get location function

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1 , color: Colors.grey)),
          height: 170,
          width: double.infinity,
          child:  _previewImageUrl == null
              ? Text(
            'no locationChosen',
            textAlign: TextAlign.center,)
              : Image.network(
            _previewImageUrl!,
            fit: BoxFit.cover,
            width: double.infinity,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
                onPressed: _getCurrentLocation,
                icon: Icon(Icons.location_on),
                label: Text('Current Location'),
                textColor: Theme.of(context).primaryColor,),

            FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,)
          ],
        ),
      ],
    );
  }
}
