// @dart=2.9
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:covid19ij/src/utils/utils.dart';

class LineAcumuladosWidget extends StatefulWidget {
  final List<int> acumulados;
  final List<int> activos;
  final List<DateTime> fechas;
  final List<charts.Series> seriesList;
  final bool animate;

  LineAcumuladosWidget(this.seriesList,
      {this.animate, this.acumulados, this.activos, this.fechas});

  factory LineAcumuladosWidget.withSampleData(
    List<int> accumulate,
    List<int> active,
    List<DateTime> dates,
  ) {
    return new LineAcumuladosWidget(
      _createSampleData(accumulate, active, dates),
    );
  }

  @override
  _LineAcumuladosWidgetState createState() => _LineAcumuladosWidgetState();

  static List<charts.Series<LinearAcc, DateTime>> _createSampleData(
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
        measureLowerBoundFn: (LinearAcc acc, _) => 0,
        colorFn: (LinearAcc cont, _) =>
            charts.ColorUtil.fromDartColor(Colors.orange),
        data: dataAcumulate,
      ),
      new charts.Series<LinearAcc, DateTime>(
        id: 'Activos',
        domainFn: (LinearAcc acc, _) => acc.fecha,
        measureFn: (LinearAcc acc, _) => acc.acc,
        measureLowerBoundFn: (LinearAcc acc, _) => 0,
        colorFn: (LinearAcc cont, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
        data: dataActive,
      )
    ];
  }
}

class _LineAcumuladosWidgetState extends State<LineAcumuladosWidget> {
  DateTime _time;
  Map<String, num> _measures;

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    DateTime time;
    final measures = <String, num>{};

    // We get the model that updated with a list of [SeriesDatum] which is
    // simply a pair of series & datum.
    //
    // Walk the selection updating the measures map, storing off the sales and
    // series name for each selection point.
    if (selectedDatum.isNotEmpty) {
      time = selectedDatum.first.datum.fecha;
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.acc;
      });
    }

    // Request a build.
    setState(() {
      _time = time;
      _measures = measures;
    });
  }

  @override
  Widget build(BuildContext context) {
    // The children consist of a Chart and Text widgets below to hold the info.
    final children = <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          "Evolución de casos por días",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      new Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child: new charts.TimeSeriesChart(
          widget.seriesList,
          selectionModels: [
            new charts.SelectionModelConfig(
              type: charts.SelectionModelType.info,
              changedListener: _onSelectionChanged,
            )
          ],
          animate: false,
          behaviors: [
            new charts.SeriesLegend(),
            new charts.LinePointHighlighter(
                drawFollowLinesAcrossChart: true,
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.none,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest),
            new charts.SelectNearest(
                eventTrigger: charts.SelectionTrigger.tapAndDrag)
          ],
        ),
      ),
    ];

    // If there is a selection, then include the details.
    if (_time != null) {
      children.add(new Padding(
          padding: new EdgeInsets.only(top: 5.0),
          child: new Text(
            _time.toStr(),
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          )));
    }
    _measures?.forEach((String series, num value) {
      children.add(new Text(
        '${series}: ${value}',
        style: TextStyle(
          color: series == "Acumulados" ? Colors.orange : Colors.blue,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ));
    });

    return Card(elevation: 2, child: new Column(children: children));
  }
}

class LinearAcc {
  final DateTime fecha;
  final int acc;

  LinearAcc(this.fecha, this.acc);
}
