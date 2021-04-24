// @dart=2.9
import 'package:covid19ij/src/pages/historial.dart';
import 'package:covid19ij/src/pages/pretty_home.dart';
import 'package:covid19ij/src/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MunicipalProvider()),
      ],
      child: MaterialApp(
        title: 'Covid-19 IJ',
        initialRoute: 'home',
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => HomeScreen(),
          'historial': (context) => HistorialPage()
        },
      ),
    );
  }
}
