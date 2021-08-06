import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/viewmodels/PreferencesViewModel.dart';

typedef BoolValue = Function(bool);

class GendersScreen extends StatefulWidget {
  final Map<String, bool> showMe;
  final BoolValue callback;

  GendersScreen(this.showMe, this.callback);

  @override
  _GendersScreenState createState() => _GendersScreenState();
}

class _GendersScreenState extends State<GendersScreen> {
  Map<String, bool> _showMe;
  final PreferencesViewModel _viewModel = PreferencesViewModel();

  @override
  void initState() {
    super.initState();
    _showMe = widget.showMe;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Show Me"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select whom do you want to see",
                    style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: SharedResources.genderMap.length,
                      itemBuilder: (context, index) => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(_showMe.keys.elementAt(index)),
                          value: _showMe[_showMe.keys.elementAt(index)],
                          onChanged: (value) {
                            setState(() {
                              _showMe[_showMe.keys.elementAt(index)] = value;
                            });
                          })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _willPopCallback() async {
    var uid = SharedResources.getCurrentUser().uid;
    var response = await _viewModel.updateShowMe(uid, _showMe);
    widget.callback(response);
    return true;
  }
}
