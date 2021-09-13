import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/viewmodels/TodayViewModel.dart';
import 'package:provider/provider.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  final uid = SharedResources.getCurrentUser().uid;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10), () => init());
  }

  void init() {
    Provider.of<TodayViewModel>(context, listen: false)
        .fetchRecommendations(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodayViewModel>(builder:
        (BuildContext context, TodayViewModel viewModel, Widget child) {
      return viewModel.cards != null
          ? Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 18,
                top: 40,
              ),
              child: Stack(
                children: viewModel.cards,
              ),
            )
          : Center(child: CircularProgressIndicator());
    });
  }
}
