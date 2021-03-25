// @dart=2.9
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class PieContagionWidget extends StatelessWidget {
  const PieContagionWidget({Key key}) : super(key: key);

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
                "Casos por Modo de Contagio",
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
                      municipalInfo.importados,
                      municipalInfo.introducidos,
                      municipalInfo.autoctonos,
                      municipalInfo.unkByContagion),
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

  List<charts.Series<ContagionData, String>> _createSampleData(
      int imp, int intr, int aut, int unk) {
    final data = [
      new ContagionData("Importados", imp, Colors.indigo),
      new ContagionData("Introducidos", intr, Colors.lightBlue),
      new ContagionData("Autóctonos", aut, Colors.blueAccent),
      new ContagionData("Desconocidos", unk, Colors.grey),
    ];

    return [
      new charts.Series<ContagionData, String>(
        id: 'Contagion',
        domainFn: (ContagionData cont, _) => cont.type,
        measureFn: (ContagionData cont, _) => cont.cant,
        data: data,
        colorFn: (ContagionData cont, _) =>
            charts.ColorUtil.fromDartColor(cont.color),
        labelAccessorFn: (ContagionData row, _) => '${row.cant}',
      )
    ];
  }
}

/// Sample linear data type.
class ContagionData {
  final String type;
  final int cant;
  final Color color;

  ContagionData(this.type, this.cant, this.color);
}
