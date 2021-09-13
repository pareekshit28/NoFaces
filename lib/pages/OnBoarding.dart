import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:no_faces/pages/InterestsScreen.dart';
import 'package:no_faces/viewmodels/OnBoardingViewModel.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  final bool update;

  const OnBoarding(
    this.update, {
    Key key,
  }) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  String _gender;
  final _user = FirebaseAuth.instance.currentUser;
  final _ageController = TextEditingController();
  final _cityController = TextEditingController();
  final _nameController = TextEditingController();
  final _helper = QueryBaseHelper();
  final uid = SharedResources.getCurrentUser().uid;
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
    Provider.of<OnBoardingViewModel>(context, listen: false)
        .getGenderDropdownItems();
    Provider.of<OnBoardingViewModel>(context, listen: false)
        .fetchUserProfile(uid);
  }

  @override
  Widget build(BuildContext context) {
    const curveHeight = 60.0;
    return Consumer<OnBoardingViewModel>(builder:
        (BuildContext context, OnBoardingViewModel viewModel, Widget child) {
      if (_gender == null &&
          viewModel.genders != null &&
          viewModel.profile != null) {
        _ageController.text = viewModel.profile.age.toString() == "0"
            ? ""
            : viewModel.profile.age.toString();
        _cityController.text = viewModel.profile.city.toString();
        _nameController.text = viewModel.profile.displayName.toString();
        _gender = viewModel.profile.gender;
      }
      return Scaffold(
        appBar: viewModel.genders != null && viewModel.profile != null
            ? AppBar(
                toolbarHeight: 50,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  child: Align(
                    alignment: Alignment(0, 1.5),
                    child: Text(
                      "Let's Get on Board!",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.3,
                          wordSpacing: -2,
                          fontWeight: FontWeight.w500,
                          fontSize: 28.0),
                    ),
                  ),
                  decoration: new ShapeDecoration(
                    shape: const MyShapeBorder(curveHeight),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color.fromRGBO(157, 171, 255, 1),
                        Color.fromRGBO(159, 140, 251, 1)
                      ],
                    ),
                  ),
                ),
              )
            : null,
        body: viewModel.genders != null && viewModel.profile != null
            ? Scrollbar(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                        right: 26.0, left: 26, bottom: 28, top: 100),
                    decoration: new ShapeDecoration(
                      shape: const MyShapeBorder(curveHeight),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color.fromRGBO(236, 223, 252, 1),
                          Color.fromRGBO(254, 255, 255, 1)
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 80,
                                backgroundColor:
                                    Color.fromRGBO(117, 121, 255, 0.7)),
                            SizedBox(
                              height: 60,
                            ),
                            TextField(
                              controller: _nameController,
                              cursorColor: Colors.purple,
                              textCapitalization: TextCapitalization.words,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 22),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color.fromRGBO(157, 171, 255, 1),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(157, 171, 255, 1),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(178, 36, 239, 1),
                                      width: 1.25),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(157, 171, 255, 1)),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextField(
                                controller: _ageController,
                                cursorColor: Colors.purple,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 22),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.accessibility_new,
                                    color: Color.fromRGBO(157, 171, 255, 1),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelText: 'Age',
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(157, 171, 255, 1),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(178, 36, 239, 1),
                                        width: 1.25),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(157, 171, 255, 1)),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: _cityController,
                                cursorColor: Colors.purple,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.streetAddress,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 22),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.location_city,
                                    color: Color.fromRGBO(157, 171, 255, 1),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelText: 'City',
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(157, 171, 255, 1),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(178, 36, 239, 1),
                                        width: 1.25),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(157, 171, 255, 1)),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        DropdownButtonFormField(
                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 30,
                            color: Color.fromRGBO(157, 171, 255, 1),
                          ),
                          items: viewModel.genders,
                          value: _gender,
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                          isDense: true,
                          itemHeight: 200,
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22),
                          decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              width: 40,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  'assets/icons/gender.svg',
                                  color: Color.fromRGBO(157, 171, 255, 1),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            labelText: 'Gender',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(157, 171, 255, 1),
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(178, 36, 239, 1),
                                  width: 1.25),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(157, 171, 255, 1)),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              if (widget.update) {
                                var response = await viewModel.updateOnBoarding(
                                    _user.uid,
                                    _nameController.text,
                                    int.parse(_ageController.text),
                                    _cityController.text,
                                    _gender);
                                Provider.of<OnBoardingViewModel>(context,
                                        listen: false)
                                    .setNull();
                                if (response) {
                                  Navigator.of(context).pop();
                                } else {
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              } else {
                                var response = await viewModel.submitOnBoarding(
                                    _user.uid,
                                    _nameController.text,
                                    int.parse(_ageController.text),
                                    _cityController.text,
                                    _gender,
                                    _user.email);
                                Provider.of<OnBoardingViewModel>(context,
                                        listen: false)
                                    .setNull();
                                if (response) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              InterestsScreen(false)),
                                      (route) => false);
                                }
                              }
                            },
                            child: loading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 1,
                                    ))
                                : widget.update
                                    ? Text("Update")
                                    : Text("Next"),
                            color: Color.fromRGBO(117, 121, 255, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
