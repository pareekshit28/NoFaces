import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:no_faces/pages/PreferencesScreen.dart';
import 'package:no_faces/viewmodels/BioViewModel.dart';
import 'package:provider/provider.dart';

class BioPage extends StatefulWidget {
  final bool update;

  const BioPage(this.update, {Key key}) : super(key: key);

  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  final _helper = QueryBaseHelper();
  final _bioController = TextEditingController();
  final uid = SharedResources.getCurrentUser().uid;
  bool lock = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10), () => init());
  }

  @override
  void dispose() {
    super.dispose();
    _helper.dispose();
  }

  void init() {
    Provider.of<BioViewModel>(context, listen: false).fetchBio(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BioViewModel>(
        builder: (BuildContext context, BioViewModel viewModel, Widget child) {
      if (viewModel.bio != null && !lock) {
        _bioController.text = viewModel.bio;
      }
      return Scaffold(
        body: SafeArea(
            child: viewModel.bio != null
                ? Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Describe more about\nYourself ❤️.",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: _bioController,
                          maxLines: 10,
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            onPressed: () async {
                              setState(() {
                                lock = true;
                                loading = true;
                              });
                              FocusScope.of(context).unfocus();
                              var response = await viewModel.updateBio(
                                  SharedResources.getCurrentUser().uid,
                                  _bioController.text);
                              Provider.of<BioViewModel>(context, listen: false)
                                  .setNull();
                              if (response) {
                                widget.update
                                    ? Navigator.of(context).pop()
                                    : Navigator.of(context).pushAndRemoveUntil(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                PreferencesScreen(false)),
                                        (route) => false);
                              } else {
                                setState(() {
                                  loading = false;
                                });
                              }
                            },
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: loading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ))
                                : widget.update
                                    ? Text("Update")
                                    : Text("Next"),
                            color: Color.fromRGBO(117, 121, 255, 1),
                          ),
                        )
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
      );
    });
  }
}
