import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:no_faces/components/ProfileCardStack.dart';
import 'package:no_faces/components/VoidWidget.dart';
import 'package:no_faces/viewmodels/TodayViewModel.dart';
import 'package:provider/provider.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodayViewModel>(builder:
        (BuildContext context, TodayViewModel viewModel, Widget child) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18,
          top: 40,
        ),
        child: Stack(
          children: viewModel.cards,
        ),
      );
    });
  }
}
