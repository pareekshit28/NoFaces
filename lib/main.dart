import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/GateKeeper.dart';
import 'package:no_faces/Services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => Services(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No Faces',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: GateKeeper(),
    );
  }
}
