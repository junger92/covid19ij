// @dart=2.9
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class LineAcumuladosWidget extends StatelessWidget {
  const LineAcumuladosWidget({Key key}) : super(key: key);

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
                "Evolución de casos por días",
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
                    _createSampleData(municipalInfo.acumulados,
                        municipalInfo.activosBydate, municipalInfo.fechas),
                    behaviors: [new charts.SeriesLegend()],
                    defaultRenderer:
                        new charts.LineRendererConfig(includePoints: true)),
              ),
            ],
          )),
    );
  }

  List<charts.Series<LinearAcc, DateTime>> _createSampleData(
      List<int> acumulados, List<int> activos, List<DateTime> fechas) {
    List<LinearAcc> dataAcumulate = [];
    List<LinearAcc> dataActive = [];
    for (var i = 0; i < acumulados.length; i++) {
      var acc = new LinearAcc(fechas[i], acumulados[i]);
      var act = new LinearAcc(fechas[i], activos[i]);
      dataAcumulate.add(acc);
      dataActive.add(act);
    }

    return [
      new charts.Series<LinearAcc, DateTime>(
        id: 'Acumulados',
        domainFn: (LinearAcc acc, _) => acc.fecha,
        measureFn: (LinearAcc acc, _) => acc.acc,
        colorFn: (LinearAcc cont, _) =>
            charts.ColorUtil.fromDartColor(Colors.orange),
        data: dataAcumulate,
      ),
      new charts.Series<LinearAcc, DateTime>(
        id: 'Activos',
        domainFn: (LinearAcc acc, _) => acc.fecha,
        measureFn: (LinearAcc acc, _) => acc.acc,
        colorFn: (LinearAcc cont, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
        data: dataActive,
      )
    ];
  }
}

class LinearAcc {
  final DateTime fecha;
  final int acc;

  LinearAcc(this.fecha, this.acc);
}
