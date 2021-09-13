import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/components/VoidWidget.dart';
import 'package:no_faces/pages/ChatScreen.dart';
import 'package:no_faces/viewmodels/FavoritesViewModel.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final uid = SharedResources.getCurrentUser().uid;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10), () => init());
  }

  void init() {
    Provider.of<FavoritesViewModel>(context, listen: false).fetchChats(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesViewModel>(builder:
        (BuildContext context, FavoritesViewModel viewModel, Widget child) {
      return viewModel.profiles != null
          ? viewModel.profiles.length == 0
              ? Center(child: VoidWidget())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.profiles.length,
                  itemBuilder: (context, index) => Padding(
                    padding: index == 0
                        ? EdgeInsets.only(
                            left: 14.0, top: 70, bottom: 7, right: 14)
                        : EdgeInsets.only(
                            left: 14.0, top: 0, bottom: 7, right: 14),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => ChatScreen(
                                    id: viewModel.profiles.elementAt(index).lid,
                                    name: viewModel.profiles
                                        .elementAt(index)
                                        .displayName,
                                    toUid:
                                        viewModel.profiles.elementAt(index).uid,
                                    callback: () {
                                      init();
                                    },
                                  )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(children: [
                            CircleAvatar(
                              radius: 27,
                              backgroundColor: Colors.transparent,
                              child: Icon(Icons.person),
                            ),
                            SizedBox(width: 14),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    viewModel.profiles
                                        .elementAt(index)
                                        .displayName,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    viewModel.profiles
                                        .elementAt(index)
                                        .subTitle,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                )
          : Center(child: CircularProgressIndicator());
    });
  }
}
