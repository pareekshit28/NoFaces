import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/viewmodels/LikesViewModel.dart';
import 'package:provider/provider.dart';

class LikesPage extends StatefulWidget {
  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  final uid = SharedResources.getCurrentUser().uid;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10), () => init());
  }

  void init() {
    Provider.of<LikesViewModel>(context, listen: false).fetchLikes(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LikesViewModel>(builder:
        (BuildContext context, LikesViewModel viewModel, Widget child) {
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
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
