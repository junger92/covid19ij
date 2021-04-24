// @dart=2.9
import 'package:covid19ij/src/models/persona.dart';
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:covid19ij/src/utils/functions.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistorialPage extends StatefulWidget {
  const HistorialPage({Key key}) : super(key: key);

  @override
  _HistorialPageState createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  DateTime init = DateTime(0);
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final municipalInfo = Provider.of<MunicipalProvider>(context);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueGrey),
          backgroundColor: Color.fromRGBO(63, 230, 169, 1),
          title: Text(
            "Historial de Casos",
            style: TextStyle(color: Colors.blueGrey),
          )),
      body: GroupedListView<Persona, DateTime>(
        elements: municipalInfo.datacovid.personas.isEmpty
            ? []
            : municipalInfo.datacovid.personas,
        groupBy: (element) => element.confirmationDate,
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1.confirmationDate.compareTo(item2.confirmationDate),
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (DateTime value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dateTimeToJson(value),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
        ),
        itemBuilder: (c, element) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Icon(
                  Icons.assignment_ind,
                  color: Color.fromRGBO(63, 230, 169, 1),
                  size: 34,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Consejo Popular: ${element.cp}'),
                    Text('Clasificación: ${element.classification}'),
                    element.clinicOut == null
                        ? Text("Estado: De Cuidado")
                        : element.pacientHealth == "Fallecido"
                            ? Text("Estado:Fallecido")
                            : Text("Estado:De Alta")
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Edad: ${element.age.toString()}'),
                    Text('Sexo: ${element.sexo}'),
                    Text('Nacionalidad: ${element.nacionality}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
