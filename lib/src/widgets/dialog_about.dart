import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutWidget extends StatefulWidget {
  final String title, description, buttonText;

  AboutWidget(
      {required this.title,
      required this.description,
      required this.buttonText});

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  "Covid19-IJ (beta)",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey),
                ),
                Text(
                  "versión 1.0.1",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Aplicación desarrollada por el Departamento de Informática de la Universidad de la Isla de la Juventud en conjunto con el Departamento de Vigilancia de la Dirección Municipal de Salud para ofrecer información actualizada sobre la covid19 en el municipio. Inspirada en la aplicación Covid19 Cuba Data",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Diseño de Logo: Alexander González Saldívar ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: Text(widget.buttonText),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            child: SvgPicture.asset(
              "assets/about.svg",
              width: 120,
            ),
            backgroundColor: Color.fromRGBO(16, 255, 168, 1),
            radius: Consts.avatarRadius,
          ),
        ),
        //...top circlular image part,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
