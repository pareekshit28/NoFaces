import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:no_faces/pages/PreferencesScreen.dart';
import 'package:no_faces/viewmodels/BioViewModel.dart';

class BioPage extends StatefulWidget {
  const BioPage({Key key}) : super(key: key);

  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  final QueryBaseHelper _helper = QueryBaseHelper();
  final BioViewModel _viewModel = BioViewModel();
  final TextEditingController _bioController = TextEditingController();

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
              "Describe more about\nYourself ❤️.",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  var response = await _viewModel.updateBio(
                      SharedResources.getCurrentUser().uid,
                      _bioController.text);
                  if (response != null) {
                    Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(
                            builder: (context) => PreferencesScreen()),
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
      )),
    );
  }
}
