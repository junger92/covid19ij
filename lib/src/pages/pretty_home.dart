// @dart=2.9
import 'package:covid19ij/src/widgets/age_widget.dart';
import 'package:covid19ij/src/widgets/consejo_select_widget.dart';
import 'package:covid19ij/src/widgets/dialog_widget.dart';
import 'package:covid19ij/src/widgets/drawer_widget.dart';
import 'package:covid19ij/src/widgets/header.dart';
import 'package:covid19ij/src/widgets/line_acumulados_widget.dart';
import 'package:covid19ij/src/widgets/line_dayli_widget.dart';
import 'package:covid19ij/src/widgets/pie_contagion_widget.dart';
import 'package:covid19ij/src/widgets/pie_sex_widget.dart';
import 'package:covid19ij/src/widgets/resume_widget.dart';
import 'package:covid19ij/src/widgets/update_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
    _showDialog();
  }

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialogWidget(
              title: "Succes",
              description: "Descargando Datos ...",
              buttonText: "Continuar",
            ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    // setState(() {
    //   offset = (controller.hasClients) ? controller.offset : 0;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/Doctors-pana.svg",
              textTop: "Covid-19 IJ",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Consejos Populares",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                      ),
                      ConsejoSelectWidget(),
                      SizedBox(
                        height: 15,
                      ),
                      UpdateWidget(),
                      ResumeWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [PieSexWidget(), PieContagionWidget()],
                      ),
                      LineAcumuladosWidget(),
                      LineDiariosWidget(),
                      AgePlotWidget()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
