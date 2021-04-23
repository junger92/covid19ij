// @dart=2.9
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class PieSexWidget extends StatelessWidget {
  const PieSexWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final municipalInfo = Provider.of<MunicipalProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Distribución de Casos por Sexo",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                child: charts.PieChart(
                  _createSampleData(
                      municipalInfo.datacovid.all.casesBySex.men.value,
                      municipalInfo.datacovid.all.casesBySex.women.value,
                      municipalInfo.datacovid.all.casesBySex.unknown.value),
                  behaviors: [
                    new charts.DatumLegend(
                      position: charts.BehaviorPosition.bottom,
                      horizontalFirst: false,
                      // This defines the padding around each legend entry.
                      cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                      // Set [showMeasures] to true to display measures in series legend.
                      showMeasures: false,
                      // Configure the measure value to be shown by default in the legend.
                      legendDefaultMeasure:
                          charts.LegendDefaultMeasure.firstValue,
                      entryTextStyle: charts.TextStyleSpec(fontSize: 11),
                    ),
                  ],
                  defaultRenderer:
                      new charts.ArcRendererConfig(arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.inside),
                  ]),
                ),
              ),
            ],
          )),
    );
  }

  List<charts.Series<SexData, String>> _createSampleData(
      int man, int woman, int unk) {
    final data = [
      new SexData("Masculinos", man, Colors.indigo),
      new SexData("Femeninos", woman, Colors.blue),
      new SexData("Desconocidos", unk, Colors.grey),
    ];

    return [
      new charts.Series<SexData, String>(
        id: 'Sexo',
        domainFn: (SexData sex, _) => sex.sexo,
        measureFn: (SexData sex, _) => sex.cant,
        data: data,
        colorFn: (SexData sex, _) => charts.ColorUtil.fromDartColor(sex.color),
        labelAccessorFn: (SexData row, _) => '${row.cant}',
      )
    ];
  }
}

/// Sample linear data type.
class SexData {
  final String sexo;
  final int cant;
  final Color color;
  SexData(this.sexo, this.cant, this.color);
}
