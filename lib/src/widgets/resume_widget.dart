// @dart=2.9
import 'package:covid19ij/src/pages/historial.dart';
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:covid19ij/src/widgets/stat_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final municipalInfo = Provider.of<MunicipalProvider>(context);
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistorialPage(
                          title: "Historial de Casos Positivos",
                          personas: municipalInfo.datacovid.personas,
                        )),
              );
            },
            child: StatCard(
              title: "Positivos",
              color: Colors.orange,
              icon: Icons.add_circle_outline,
              cifra: municipalInfo.datacovid.all.resume.isEmpty
                  ? "Sin datos"
                  : '${municipalInfo.datacovid.all.resume[0].value.toInt().toString()}',
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistorialPage(
                          title: "Historial de Casos Recuperados",
                          personas: municipalInfo.datacovid.personas
                              .where((element) => element.clinicOut != null)
                              .toList(),
                        )),
              );
            },
            child: StatCard(
              title: "Recuperados",
              color: Colors.green,
              icon: Icons.home_outlined,
              cifra: municipalInfo.datacovid.all.resume.isEmpty
                  ? "Sin datos"
                  : '${municipalInfo.datacovid.all.resume[2].value.toInt().toString()}',
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistorialPage(
                          title: "Casos Activos",
                          personas: municipalInfo.datacovid.personas
                              .where((element) => element.clinicOut == null)
                              .toList(),
                        )),
              );
            },
            child: StatCard(
              title: "Activos",
              color: Colors.blue,
              icon: Icons.hotel,
              cifra: municipalInfo.datacovid.all.resume.isEmpty
                  ? "Sin datos"
                  : '${municipalInfo.datacovid.all.resume[1].value.toInt().toString()}',
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistorialPage(
                          title: "Historial de Casos Fallecidos",
                          personas: municipalInfo.datacovid.personas
                              .where((element) =>
                                  element.pacientHealth == "Fallecido")
                              .toList(),
                        )),
              );
            },
            child: StatCard(
              title: "Fallecidos",
              color: Colors.red,
              icon: Icons.highlight_remove,
              cifra: municipalInfo.datacovid.all.resume.isEmpty
                  ? "Sin datos"
                  : '${municipalInfo.datacovid.all.resume[4].value.toInt().toString()}',
            ),
          ),
        ),
      ],
    );
  }
}
