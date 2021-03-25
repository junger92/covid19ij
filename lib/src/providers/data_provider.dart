// @dart=2.9
import 'dart:convert';
import 'package:covid19ij/src/models/consejo_popular.dart';
import 'package:covid19ij/src/models/data.dart';
import 'package:covid19ij/src/models/item_code_plus.dart';
import 'package:covid19ij/src/models/municipal.dart';
import 'package:covid19ij/src/utils/http_proxy.dart';
import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

class MunicipalProvider extends ChangeNotifier {
  final LocalStorage storage = new LocalStorage('covid19');
  bool _dataGet = false;
  DateTime _update = DateTime(0); //fecha de actualizacion
  double _positivos = 0; // acumulados positivos
  double _active = 0; //casos activos
  double _recovery = 0; // casos recuperados
  double _death = 0; // acumulados fallecidos
  double _newPositivos = 0; // acumulados positivos
  double _newRecovery = 0; // casos recuperados
  double _newDeath = 0; // acumulados fallecidos
  int _manInfected = 1; // cantidad de hombres infectados
  int _womanInfected = 1; // cantidad de mujeres infectadas
  int _unkInfected = 1; // sin determinar sexo infectados (datos erroneos)
  int _imported = 1; // casos importados
  int _introduced = 1; // casos introducidos
  int _autoctonos = 1; // casos autoctonos
  int _unkModeContagion = 1; // casos con modo de contagio desconociod
  double _tasa = 0.0; // Tasa (por 100 mil) Últimos 15 Días
  List<int> _acummulate = [];
  List<int> _actives = [];
  List<int> _daily = [];
  List<DateTime> _dates = [];
  List<String> _cp = ["Todos"];
  List<ConsejoPopular> _consejos = [];
  List<ItemCodePlus> _ageRank = [];

  List<ItemCodePlus> get ages {
    return _ageRank;
  }

  double get tasa {
    return _tasa;
  }

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

  List<DateTime> get fechas {
    return _dates;
  }

  List<int> get diarios {
    return _daily;
  }

  List<int> get acumulados {
    return _acummulate;
  }

  List<int> get activosBydate {
    return _actives;
  }

  int get importados {
    return _imported;
  }

  int get introducidos {
    return _introduced;
  }

  int get autoctonos {
    return _autoctonos;
  }

  int get unkByContagion {
    return _unkModeContagion;
  }

  int get manInfected {
    return _manInfected;
  }

  int get womanInfected {
    return _womanInfected;
  }

  int get unkInfected {
    return _unkInfected;
  }

  double get positivos {
    return _positivos;
  }

  double get activos {
    return _active;
  }

  double get recuperados {
    return _recovery;
  }

  double get fallecidos {
    return _death;
  }

  double get newPositivos {
    return _newPositivos;
  }

  double get newRecuperados {
    return _newRecovery;
  }

  double get newFallecidos {
    return _newDeath;
  }

  DateTime get update {
    return _update;
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
      Data all = Data.fromJson(data);
      fetchData(all.all);
      fetchConsejos(all.provinces);
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
      result = Data.fromJson(json);
      final all = result;
      _saveToStorage(json);
      //await writeCounter(all.toJson().toString());
      fetchData(all.all);
      fetchConsejos(all.provinces);
      print("data ok");
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

  void fetchData(all) {
    try {
      _update = all.updated;
      _positivos = all.resume[0].value;
      _active = all.resume[1].value;
      _recovery = all.resume[2].value;
      _death = all.resume[4].value;
      _newPositivos = all.resume[5].value;
      _newRecovery = all.resume[6].value;
      _newDeath = all.resume[7].value;
      _tasa = all.resume[8].value;
      _manInfected = all.casesBySex.men.value;
      _womanInfected = all.casesBySex.women.value;
      _unkInfected = all.casesBySex.unknown.value;
      _imported = all.casesByModeOfContagion.imported.value;
      _introduced = all.casesByModeOfContagion.inserted.value;
      _autoctonos = all.casesByModeOfContagion.autochthonous.value;
      _unkModeContagion = all.casesByModeOfContagion.unknown.value;
      _acummulate = all.evolutionOfCasesByDays.accumulated.values;
      _actives = all.evolutionOfCasesByDays.active.values;
      _dates = all.evolutionOfCasesByDays.date.values;
      _daily = all.evolutionOfCasesByDays.daily.values;
      _ageRank = all.distributionByAgeRanges;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  void fetchConsejo(String consejo) {
    if (consejo == "Todos")
      getFromStorage();
    else {
      int index = _cp.indexOf(consejo);
      Municipal all = _consejos[index - 1].all;
      fetchData(all);
    }
  }
}
