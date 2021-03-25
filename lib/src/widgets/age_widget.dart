// @dart=2.9
import 'package:covid19ij/src/models/item_code_plus.dart';
import 'package:flutter/material.dart';

import 'package:covid19ij/src/providers/data_provider.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class AgePlotWidget extends StatelessWidget {
  const AgePlotWidget({Key key}) : super(key: key);

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
                "Distribución de casos por rangos de edad",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: charts.BarChart(
                  _createSampleData(municipalInfo.ages),
                  animate: false,
                  barGroupingType: charts.BarGroupingType.grouped,
                  behaviors: [new charts.SeriesLegend()],
                ),
              ),
            ],
          )),
    );
  }

  List<charts.Series<OrdinalSales, String>> _createSampleData(
      List<ItemCodePlus> agesRankList) {
    final total = agesRankList.length != 0
        ? [
            new OrdinalSales('0-19', agesRankList[0].value),
            new OrdinalSales('20-39', agesRankList[1].value),
            new OrdinalSales('40-59', agesRankList[2].value),
            new OrdinalSales('60-79', agesRankList[3].value),
            new OrdinalSales('>=80', agesRankList[4].value),
          ]
        : [
            new OrdinalSales('0-19', 0),
            new OrdinalSales('20-39', 0),
            new OrdinalSales('40-59', 0),
            new OrdinalSales('60-79', 0),
            new OrdinalSales('>=80', 0),
          ];

    final masculinos = agesRankList.length != 0
        ? [
            new OrdinalSales('0-19', agesRankList[0].men),
            new OrdinalSales('20-39', agesRankList[1].men),
            new OrdinalSales('40-59', agesRankList[2].men),
            new OrdinalSales('60-79', agesRankList[3].men),
            new OrdinalSales('>=80', agesRankList[4].men),
          ]
        : [
            new OrdinalSales('0-19', 0),
            new OrdinalSales('20-39', 0),
            new OrdinalSales('40-59', 0),
            new OrdinalSales('60-79', 0),
            new OrdinalSales('>=80', 0),
          ];

    final femeninos = agesRankList.length != 0
        ? [
            new OrdinalSales('0-19', agesRankList[0].women),
            new OrdinalSales('20-39', agesRankList[1].women),
            new OrdinalSales('40-59', agesRankList[2].women),
            new OrdinalSales('60-79', agesRankList[3].women),
            new OrdinalSales('>=80', agesRankList[4].women),
          ]
        : [
            new OrdinalSales('0-19', 0),
            new OrdinalSales('20-39', 0),
            new OrdinalSales('40-59', 0),
            new OrdinalSales('60-79', 0),
            new OrdinalSales('>=80', 0),
          ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Total',
        domainFn: (OrdinalSales sales, _) => sales.rango,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: total,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Masculino',
        domainFn: (OrdinalSales sales, _) => sales.rango,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: masculinos,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Femenino',
        domainFn: (OrdinalSales sales, _) => sales.rango,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: femeninos,
      )
    ];
  }
}

class OrdinalSales {
  final String rango;
  final int sales;

  OrdinalSales(this.rango, this.sales);
}
