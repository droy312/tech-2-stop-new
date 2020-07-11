import 'package:flutter/material.dart';
// import 'package:tech_2_stop_new/screens/home/home.dart';
import 'package:tech_two_stop/screens/home/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech 2 Stop',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}