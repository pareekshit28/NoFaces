import 'package:flutter/material.dart';
import 'package:no_faces/pages/HomeScreen.dart';
import 'package:no_faces/pages/LoginScreen.dart';
import 'package:no_faces/pages/OnBoarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No Faces',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomeScreen(),
    );
  }
}
