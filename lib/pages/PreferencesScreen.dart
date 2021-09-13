import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:no_faces/pages/GendersScreen.dart';
import 'package:no_faces/pages/HomeScreen.dart';
import 'package:no_faces/viewmodels/PreferencesViewModel.dart';
import 'package:provider/provider.dart';

class PreferencesScreen extends StatefulWidget {
  final bool update;

  PreferencesScreen(this.update, {Key key}) : super(key: key);

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  RangeValues _currentRangeValues;
  final uid = SharedResources.getCurrentUser().uid;
  final _helper = QueryBaseHelper();
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
    Provider.of<PreferencesViewModel>(context, listen: false).fetchShowMe(uid);
    Provider.of<PreferencesViewModel>(context, listen: false)
        .fetchStartAge(uid);
    Provider.of<PreferencesViewModel>(context, listen: false).fetchEndAge(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesViewModel>(
        builder: (BuildContext context, viewModel, Widget child) {
      if (_currentRangeValues == null &&
          viewModel.startAge != null &&
          viewModel.endAge != null)
        _currentRangeValues = RangeValues(
            viewModel.startAge.toDouble(), viewModel.endAge.toDouble());
      List<String> showMe = [];
      viewModel.showMe.forEach((key, value) {
        if (value) {
          showMe.add(key);
        }
      });
      return Scaffold(
        body: viewModel.startAge != null && viewModel.endAge != null
            ? SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Set Your Preferences ⚙️",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Show Me",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Text(showMe.length != 0
                                          ? showMe.toString().substring(
                                              1, showMe.toString().length - 1)
                                          : "Select Gender"),
                                    ),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      GendersScreen(viewModel.showMe, (value) {
                                        if (value) {
                                          Provider.of<PreferencesViewModel>(
                                                  context,
                                                  listen: false)
                                              .fetchShowMe(uid);
                                        }
                                      })),
                            )),
                    Divider(
                      indent: 18,
                      endIndent: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Age Group",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RangeSlider(
                                  values: _currentRangeValues,
                                  min: 18,
                                  max: 100,
                                  divisions: 100 - 18,
                                  labels: RangeLabels(
                                    _currentRangeValues.start
                                        .round()
                                        .toString(),
                                    _currentRangeValues.end.round().toString(),
                                  ),
                                  onChanged: (values) {
                                    setState(() {
                                      _currentRangeValues = values;
                                    });
                                  }),
                            ],
                          )),
                    ),
                    Divider(
                      indent: 18,
                      endIndent: 18,
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: MaterialButton(
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            var response1 =
                                await Provider.of<PreferencesViewModel>(context,
                                        listen: false)
                                    .updateStartAge(
                                        uid, _currentRangeValues.start.toInt());
                            var response2 =
                                await Provider.of<PreferencesViewModel>(context,
                                        listen: false)
                                    .updateEndAge(
                                        uid, _currentRangeValues.end.toInt());
                            Provider.of<PreferencesViewModel>(context,
                                    listen: false)
                                .setNull();
                            if (response1 && response2) {
                              widget.update
                                  ? Navigator.of(context).pop()
                                  : Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) => HomeScreen()),
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
                      ),
                    )
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      );
    });
  }
}
