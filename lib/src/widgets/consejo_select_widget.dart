// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:covid19ij/src/providers/data_provider.dart';

class ConsejoSelectWidget extends StatefulWidget {
  const ConsejoSelectWidget({Key key}) : super(key: key);

  @override
  _ConsejoSelectWidgetState createState() => _ConsejoSelectWidgetState();
}

class _ConsejoSelectWidgetState extends State<ConsejoSelectWidget> {
  String select = "Todos";

  void onSelected(value) {
    setState(() {
      select = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final municipalInfo = Provider.of<MunicipalProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset("assets/maps-and-flags.svg"),
          SizedBox(width: 20),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              icon: SvgPicture.asset("assets/dropdown.svg"),
              value: select,
              items: municipalInfo.cp.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String value) {
                municipalInfo.fetchConsejo(value);
                onSelected(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
