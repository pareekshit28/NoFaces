import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:no_faces/GateKeeper.dart';
import 'package:no_faces/viewmodels/BioViewModel.dart';
import 'package:no_faces/viewmodels/FavoritesViewModel.dart';
import 'package:no_faces/viewmodels/InterestsViewModel.dart';
import 'package:no_faces/viewmodels/LikesViewModel.dart';
import 'package:no_faces/viewmodels/OnBoardingViewModel.dart';
import 'package:no_faces/viewmodels/PreferencesViewModel.dart';
import 'package:no_faces/viewmodels/ProfileViewModel.dart';
import 'package:no_faces/viewmodels/TodayViewModel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MultiProvider(providers: [
            ChangeNotifierProvider<PreferencesViewModel>(
                create: (BuildContext context) => PreferencesViewModel()),
            ChangeNotifierProvider<TodayViewModel>(
                create: (BuildContext context) => TodayViewModel()),
            ChangeNotifierProvider<ProfileViewModel>(
                create: (BuildContext context) => ProfileViewModel()),
            ChangeNotifierProvider<LikesViewModel>(
                create: (BuildContext context) => LikesViewModel()),
            ChangeNotifierProvider<InterestsViewModel>(
                create: (BuildContext context) => InterestsViewModel()),
            ChangeNotifierProvider<OnBoardingViewModel>(
                create: (BuildContext context) => OnBoardingViewModel()),
            ChangeNotifierProvider<BioViewModel>(
                create: (BuildContext context) => BioViewModel()),
            ChangeNotifierProvider<FavoritesViewModel>(
                create: (BuildContext context) => FavoritesViewModel())
          ], builder: (BuildContext context, Widget child) => MyApp())));
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
