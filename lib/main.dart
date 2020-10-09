import 'package:flutter/material.dart';
import 'package:self_discipline/view/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self Discipline',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'JosefinSans',
      ),
      home: MyHomePage(),
    );
  }
}

