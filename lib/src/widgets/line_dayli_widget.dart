// @dart=2.9
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class LineDiariosWidget extends StatelessWidget {
  const LineDiariosWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final municipalInfo = Provider.of<MunicipalProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Evolución de casos nuevos en el día",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: charts.TimeSeriesChart(
                  _createSampleData(
                      municipalInfo.diarios, municipalInfo.fechas),
                  defaultInteractions: false,
                  defaultRenderer: new charts.BarRendererConfig<DateTime>(),
                ),
              ),
            ],
          )),
    );
  }

  List<charts.Series<LinearAcc, DateTime>> _createSampleData(
      List<int> acumulados, List<DateTime> fechas) {
    List<LinearAcc> dataDiario = [];
    for (var i = 0; i < acumulados.length; i++) {
      var acc = new LinearAcc(fechas[i], acumulados[i]);
      dataDiario.add(acc);
    }

    return [
      new charts.Series<LinearAcc, DateTime>(
        id: 'Casos nuevos en el día',
        domainFn: (LinearAcc acc, _) => acc.fecha,
        measureFn: (LinearAcc acc, _) => acc.acc,
        colorFn: (LinearAcc cont, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
        data: dataDiario,
      )
    ];
  }
}

class LinearAcc {
  final DateTime fecha;
  final int acc;

  LinearAcc(this.fecha, this.acc);
}
