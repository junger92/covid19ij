import 'package:covid19ij/src/utils/device_utils.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final MaterialColor color;
  final IconData icon;
  final String cifra;
  const StatCard(
      {Key? key,
      required this.title,
      required this.color,
      required this.icon,
      required this.cifra})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = getScaledWidth(context, 1);
    final screenHeight = getScaledHeight(context, 1);
    return Container(
      width: screenWidth * 0.25,
      height: screenHeight * 0.20,
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: color,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
            Icon(
              icon,
              size: 34,
              color: color,
            ),
            Text(
              cifra,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.w700, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
