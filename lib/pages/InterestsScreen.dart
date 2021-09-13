import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:no_faces/pages/BioPage.dart';
import 'package:no_faces/viewmodels/InterestsViewModel.dart';
import 'package:provider/provider.dart';

class InterestsScreen extends StatefulWidget {
  final bool update;

  const InterestsScreen(this.update, {Key key}) : super(key: key);

  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final _user = FirebaseAuth.instance.currentUser;
  final _helper = QueryBaseHelper();
  var uid = SharedResources.getCurrentUser().uid;
  List<String> tags;
  final _controller = TextEditingController();
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
    Provider.of<InterestsViewModel>(context, listen: false).fetchInterests(uid);
  }

  Future<bool> onWillPop() async {
    Provider.of<InterestsViewModel>(context, listen: false).setNull();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Consumer<InterestsViewModel>(builder:
          (BuildContext context, InterestsViewModel viewModel, Widget child) {
        if (viewModel.tags != null) {
          tags = viewModel.tags;
        }
        return Scaffold(
          body: SafeArea(
            child: tags != null
                ? Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter few tags that\ndefine YOU.",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.3,
                          ),
                          child: SingleChildScrollView(
                            child: Wrap(
                              spacing: 10,
                              children: List.generate(
                                  tags.length,
                                  (index) => Chip(
                                        label: Text(tags.elementAt(index)),
                                        onDeleted: () {
                                          setState(() {
                                            tags.removeAt(index);
                                          });
                                        },
                                      )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              hintText: "Enter tags..",
                              helperText:
                                  "Enter tags seperated by a comma ( , )",
                              border: OutlineInputBorder()),
                          onChanged: (value) {
                            if (value.characters.last == ",") {
                              _controller.clear();
                              setState(() {
                                tags.add(value.substring(0, value.length - 1));
                              });
                            }
                          },
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              FocusScope.of(context).unfocus();
                              var response = await viewModel.updateInterests(
                                  _user.uid, tags.isEmpty ? null : tags);
                              Provider.of<InterestsViewModel>(context,
                                      listen: false)
                                  .setNull();
                              if (response) {
                                widget.update
                                    ? Navigator.of(context).pop()
                                    : Navigator.of(context).pushAndRemoveUntil(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                BioPage(false)),
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
                  ),
          ),
        );
      }),
    );
  }
}
