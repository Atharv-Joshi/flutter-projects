import 'package:flutter/foundation.dart';
import '../models/place.dart';
import 'dart:io';

import 'package:greatplaces/helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items{
    return [..._items];
  }

  var i = 0;
  void addPlace(String pickedTitle , File pickedImage){
    final newPlace = Place(id: DateTime.now().toString(), title: pickedTitle, location: null, image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id' : newPlace.id,
      'title' : newPlace.title,
      'image' : newPlace.image.path
    });
  }//add place

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.get('user_places');
    _items = dataList.map((item) => Place(id: item['id'], title: item['title'], location: null, image: File(item['image']))).toList();
    notifyListeners();
  }
}