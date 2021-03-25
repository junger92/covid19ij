import 'package:flutter/material.dart';

///
/// accepts a double [scale] and returns scaled sized based on the screen
/// width
///
double getScaledWidth(BuildContext context, double scale) =>
    scale * MediaQuery.of(context).size.width;

///
/// accepts a double [scale] and returns scaled sized based on the screen
/// height
///
double getScaledHeight(BuildContext context, double scale) =>
    scale * MediaQuery.of(context).size.height;
