// @dart=2.9
import 'package:covid19ij/src/models/data.dart';
import 'package:flutter/material.dart';

class DataService with ChangeNotifier {
  Data _datacovid;

  Data get datacovid => this._datacovid;

  set datacovid(Data data) {
    this._datacovid = data;
    notifyListeners();
  }
}
