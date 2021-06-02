import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:no_faces/Services.dart';

class OnBoarding extends StatefulWidget {
  final Services _services = Services();
  final User _user = FirebaseAuth.instance.currentUser;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  String _gender;

  @override
  Widget build(BuildContext context) {
    const curveHeight = 60.0;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
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
                Color.fromRGBO(178, 36, 239, 1),
                Color.fromRGBO(117, 121, 255, 1)
              ],
            ),
          ),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
                right: 26.0, left: 26, bottom: 28, top: 100),
            decoration: new ShapeDecoration(
              shape: const MyShapeBorder(curveHeight),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(233, 206, 247, 1),
                  Color.fromRGBO(239, 240, 255, 1)
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
                        backgroundColor: Color.fromRGBO(117, 121, 255, 0.7)),
                    SizedBox(
                      height: 60,
                    ),
                    TextField(
                      controller: widget._nameController,
                      cursorColor: Colors.purple,
                      style: TextStyle(color: Colors.grey[800], fontSize: 22),
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
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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
                        controller: widget._ageController,
                        cursorColor: Colors.purple,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.grey[800], fontSize: 22),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.accessibility_new,
                            color: Color.fromRGBO(157, 171, 255, 1),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
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
                                  color: Color.fromRGBO(157, 171, 255, 1)),
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
                        controller: widget._cityController,
                        cursorColor: Colors.purple,
                        style: TextStyle(color: Colors.grey[800], fontSize: 22),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Color.fromRGBO(157, 171, 255, 1),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
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
                                  color: Color.fromRGBO(157, 171, 255, 1)),
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
                  items: widget._services.getGenderDropdownItems(),
                  value: _gender,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  isDense: true,
                  itemHeight: 200,
                  style: TextStyle(color: Colors.grey[800], fontSize: 22),
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
                          color: Color.fromRGBO(178, 36, 239, 1), width: 1.25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(157, 171, 255, 1)),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: widget._bioController,
                  maxLines: 7,
                  keyboardType: TextInputType.multiline,
                  cursorColor: Colors.purple,
                  style: TextStyle(color: Colors.grey[800], fontSize: 22),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Bio',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(157, 171, 255, 1),
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(178, 36, 239, 1), width: 1.25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(157, 171, 255, 1)),
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
                    onPressed: () {
                      widget._services.submitOnBoarding(
                          3.toString(),
                          widget._nameController.text,
                          int.parse(widget._ageController.text),
                          widget._cityController.text,
                          widget._bioController.text);
                    },
                    child: Text("Next"),
                    color: Color.fromRGBO(117, 121, 255, 1),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
