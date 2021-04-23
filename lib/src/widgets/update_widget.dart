// @dart=2.9
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:covid19ij/src/widgets/update_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19ij/src/utils/utils.dart';

class UpdateWidget extends StatelessWidget {
  const UpdateWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final municipalInfo = Provider.of<MunicipalProvider>(context);
    DateTime update = municipalInfo.datacovid.all.updated;
    return Container(
      width: double.infinity,
      child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Datos del día ${update.toStrPlus()}',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              UpdateListWidget(
                title: 'Casos Nuevos:',
                cifra: municipalInfo.datacovid.all.resume.isEmpty
                    ? "Sin datos"
                    : '${municipalInfo.datacovid.all.resume[5].value.toInt().toString()}',
              ),
              UpdateListWidget(
                title: 'Recuperados Nuevos:',
                cifra: municipalInfo.datacovid.all.resume.isEmpty
                    ? "Sin datos"
                    : '${municipalInfo.datacovid.all.resume[6].value.toInt().toString()}',
              ),
              UpdateListWidget(
                title: 'Fallecidos Nuevos:',
                cifra: municipalInfo.datacovid.all.resume.isEmpty
                    ? "Sin datos"
                    : '${municipalInfo.datacovid.all.resume[7].value.toInt().toString()}',
              ),
              UpdateListWidget(
                title: 'Tasa (x100 mil) Últimos 15 Días:',
                cifra: municipalInfo.datacovid.all.resume.isEmpty
                    ? "Sin datos"
                    : '${municipalInfo.datacovid.all.resume[8].value.toStringAsFixed(3)}',
              ),
            ],
          )),
    );
  }
}
