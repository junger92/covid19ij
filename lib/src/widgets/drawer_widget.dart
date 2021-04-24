import 'package:covid19ij/src/widgets/dialog_about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dialog_widget.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialogWidget(
          title: "Succes",
          description: "Descargando Datos ...",
          buttonText: "Continuar"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/sidebar.svg",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),

                      Container(), // I dont know why it can't work without container
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(16, 255, 168, 1),
                  Color.fromRGBO(63, 230, 169, 1),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.sticky_note_2_outlined),
            title: Text('Historial de Casos'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Actualizar Datos'),
            onTap: () => {_showDialog()},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Acerca de ...'),
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AboutWidget(
                      title: "Succes",
                      description: "Descargando Datos ...",
                      buttonText: "Continuar"))
            },
          ),
        ],
      ),
    );
  }
}
