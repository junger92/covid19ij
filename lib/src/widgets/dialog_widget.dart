// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:covid19ij/src/models/data.dart';

class CustomDialogWidget extends StatefulWidget {
  final String title, description, buttonText;

  CustomDialogWidget({this.title, this.description, this.buttonText});

  @override
  _CustomDialogWidgetState createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  Future<Data> _future;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final municipalInfo = Provider.of<MunicipalProvider>(context);
    bool refreshInfo = false;
    _runFuture() {
      print("future");

      print("jaja");
      _future = municipalInfo.getIslaDataFrom(
          "https://aulavirtual.uij.edu.cu/pluginfile.php/11919/mod_resource/content/2/test.json");
    }

    if (_future == null) {
      _runFuture();
    }
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
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
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasError) {
                      refreshInfo = false;
                      print("error");
                      municipalInfo.getFromStorage();
                      return Column(children: [
                        Text(
                          "Error de Red, por favor revise su conexión",
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _runFuture();
                            });
                          },
                          icon: Icon(
                            Icons.restore_sharp,
                            color: Color.fromRGBO(16, 255, 168, 1),
                          ),
                          iconSize: 60.0,
                        ),
                      ]);
                    } else if (snapshot.hasData ||
                        snapshot.connectionState == ConnectionState.done) {
                      refreshInfo = false;
                      print("data");
                      print(snapshot.data);
                      return Text(
                        "Datos Actualizados",
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.green),
                      );
                    } else {
                      print("progress");
                      return Column(
                        children: [
                          CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(16, 255, 168, 1)),
                          ),
                          Text(
                            widget.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // To close the dialog
                    },
                    child: Text(widget.buttonText),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
              child: SvgPicture.asset(
                "assets/download.svg",
                width: 120,
              ),
              backgroundColor: Color.fromRGBO(16, 255, 168, 1),
              radius: Consts.avatarRadius,
            ),
          ),
          //...top circlular image part,
        ],
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
