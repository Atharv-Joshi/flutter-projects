import 'dart:convert';
import 'dart:io' show File;
import 'package:flutter/services.dart' show rootBundle;


void main(){
  Map x = jsonDecode(new File('list-time-zone.json').readAsStringSync());
  print(x['status']);
}


