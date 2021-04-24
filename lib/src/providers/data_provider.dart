// @dart=2.9
import 'dart:convert';
import 'package:covid19ij/src/models/consejo_popular.dart';
import 'package:covid19ij/src/models/data.dart';
import 'package:covid19ij/src/utils/http_proxy.dart';
import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

class MunicipalProvider extends ChangeNotifier {
  final LocalStorage storage = new LocalStorage('covid19');
  bool _dataGet = false;
  List<String> _cp = ["Todos"];
  List<ConsejoPopular> _consejos = [];
  Data _datacovid = Data();

  Data get datacovid => this._datacovid;

  List<ConsejoPopular> get consejos {
    return _consejos;
  }

  List<String> get cp {
    return _cp;
  }

  bool get dataGet {
    return _dataGet;
  }

  void changedataGet() {
    _dataGet = false;
    notifyListeners();
  }

  _saveToStorage(json) async {
    bool x = await storage.ready;
    if (x)
      storage.setItem('all', json);
    else
      print("upss storage");
  }

  Future<bool> getFromStorage() async {
    _dataGet = true;
    bool x = await storage.ready;
    Map<String, dynamic> data = storage.getItem('all');
    //print(data.toString());

    if (data != null) {
      this._datacovid = Data.fromJson(data);
      fetchConsejos(this._datacovid.provinces);
      notifyListeners();
    }
    return x;
  }

  Future<Data> getIslaDataFrom(String url) async {
    Data result;
    //print(url);
    _dataGet = true;
    var resp = await get(
        Uri.https('aulavirtual.uij.edu.cu',
            '/pluginfile.php/11919/mod_resource/content/2/test.json'),
        headers: {
          'Accept-Encoding': 'gzip, deflate, br',
        });

    //print(resp.statusCode);

    if (resp.statusCode == 404) {
      print('Source is invalid');
      getFromStorage();
    } else if (resp.statusCode != 200) {
      print('Bad request');
      getFromStorage();
    }
    try {
      var text = utf8.decode(resp.bodyBytes);
      var json = jsonDecode(text);
      this._datacovid = Data.fromJson(json);
      _saveToStorage(json);
      //await writeCounter(all.toJson().toString());
      fetchConsejos(this._datacovid.provinces);
      notifyListeners();
      print("data ok");
      print(this._datacovid.personas[0].address);
    } catch (e) {
      print(e.toString());
      getFromStorage();
      print('Parse error');
    }
    return result;
  }

  void fetchConsejos(Map<String, ConsejoPopular> consejosList) {
    consejosList.forEach((key, obj) => {fillConsejos(key, obj)});
  }

  fillConsejos(String k, ConsejoPopular obj) {
    //print(k);
    //print(obj.all.resume[0].value);
    if (!_cp.contains(k)) {
      _cp.add(k);
      _consejos.add(obj);
    }
  }

  void fetchConsejo(String consejo) {
    if (consejo == "Todos")
      getFromStorage();
    else {
      int index = _cp.indexOf(consejo);
      this._datacovid.all = _consejos[index - 1].all;
      notifyListeners();
    }
  }
}
