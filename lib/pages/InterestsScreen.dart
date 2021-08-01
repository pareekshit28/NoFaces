import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/GateKeeper.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:no_faces/pages/BioPage.dart';
import 'package:no_faces/viewmodels/InterestsViewModel.dart';
import 'package:textfield_tags/textfield_tags.dart';

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final InterestsViewModel _viewModel = InterestsViewModel();
  final User _user = FirebaseAuth.instance.currentUser;
  final List<String> tags = [];
  final QueryBaseHelper _helper = QueryBaseHelper();

  @override
  void dispose() {
    super.dispose();
    _helper.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter few tags that\ndefine YOU.",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldTags(
                  tagsStyler: TagsStyler(
                      tagTextPadding: EdgeInsets.all(4),
                      tagTextStyle: TextStyle(color: Colors.black),
                      tagCancelIcon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      tagDecoration: BoxDecoration(color: Colors.grey)),
                  textFieldStyler: TextFieldStyler(
                      helperText: "Enter tags seperated by comma ( , )",
                      hintText: "Enter tags"),
                  onTag: (value) {
                    tags.add(value);
                  },
                  onDelete: (value) {
                    tags.remove(value);
                  }),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () async {
                    var response =
                        await _viewModel.updateInterests(_user.uid, tags);
                    if (response) {
                      Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(builder: (context) => BioPage()),
                          (route) => false);
                    }
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Next"),
                  color: Color.fromRGBO(117, 121, 255, 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
