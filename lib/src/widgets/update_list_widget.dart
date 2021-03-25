import 'package:flutter/material.dart';

class UpdateListWidget extends StatelessWidget {
  final String title;
  final String cifra;
  const UpdateListWidget({Key? key, required this.title, required this.cifra})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(title,
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(cifra,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
