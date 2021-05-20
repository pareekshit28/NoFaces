import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoarding extends StatefulWidget {
  final List<DropdownMenuItem<String>> _genderList = [
    DropdownMenuItem(
      child: Text("Woman"),
      value: "Woman",
    ),
    DropdownMenuItem(
      child: Text("Man"),
      value: "Man",
    ),
    DropdownMenuItem(
      child: Text("Agender"),
      value: "Agender",
    ),
    DropdownMenuItem(
      child: Text("Androgynous"),
      value: "Androgynous",
    ),
    DropdownMenuItem(
      child: Text("Bigender"),
      value: "Bigender",
    ),
    DropdownMenuItem(
      child: Text("Genderfluid"),
      value: "Genderfluid",
    ),
    DropdownMenuItem(
      child: Text("Genderqueer"),
      value: "Genderqueer",
    ),
    DropdownMenuItem(
      child: Text("Gender Nonconforming"),
      value: "Gender Nonconforming",
    ),
    DropdownMenuItem(
      child: Text("Hijra"),
      value: "Hijra",
    ),
    DropdownMenuItem(
      child: Text("Intersex"),
      value: "Intersex",
    ),
    DropdownMenuItem(
      child: Text("Non-binary"),
      value: "Non-binary",
    ),
    DropdownMenuItem(
      child: Text("Pangender"),
      value: "Pangender",
    ),
    DropdownMenuItem(
      child: Text("Transfeminine"),
      value: "Transfeminine",
    ),
    DropdownMenuItem(
      child: Text("Transgender"),
      value: "Transgender",
    ),
    DropdownMenuItem(
      child: Text("Trans Man"),
      value: "Trans Man",
    ),
    DropdownMenuItem(
      child: Text("Transmasculine"),
      value: "Transmasculine",
    ),
    DropdownMenuItem(
      child: Text("Transsexual"),
      value: "Transsexual",
    ),
    DropdownMenuItem(
      child: Text("Trans Woman"),
      value: "Trans Woman",
    ),
    DropdownMenuItem(
      child: Text("Two Spirit"),
      value: "Two Spirit",
    ),
    DropdownMenuItem(
      child: Text("Other gender"),
      value: "Other gender",
    ),
  ];

  final List<DropdownMenuItem<String>> _orientationList = [
    DropdownMenuItem(
      child: Text("Straight"),
      value: "Straight",
    ),
    DropdownMenuItem(
      child: Text("Gay"),
      value: "Gay",
    ),
    DropdownMenuItem(
      child: Text("Bisexual"),
      value: "Bisexual",
    ),
    DropdownMenuItem(
      child: Text("Asexual"),
      value: "Asexual",
    ),
    DropdownMenuItem(
      child: Text("Demisexual"),
      value: "Demisexual",
    ),
    DropdownMenuItem(
      child: Text("Homoflexible"),
      value: "Homoflexible",
    ),
    DropdownMenuItem(
      child: Text("Heteroflexible"),
      value: "Heteroflexible",
    ),
    DropdownMenuItem(
      child: Text("Lesbian"),
      value: "Lesbian",
    ),
    DropdownMenuItem(
      child: Text("Pansexual"),
      value: "Pansexual",
    ),
    DropdownMenuItem(
      child: Text("Queer"),
      value: "Queer",
    ),
    DropdownMenuItem(
      child: Text("Questioning"),
      value: "Questioning",
    ),
    DropdownMenuItem(
      child: Text("Gray-asexual"),
      value: "Gray-asexual",
    ),
    DropdownMenuItem(
      child: Text("Reciprosexual"),
      value: "Reciprosexual",
    ),
    DropdownMenuItem(
      child: Text("Akiosexual"),
      value: "Akiosexual",
    ),
    DropdownMenuItem(
      child: Text("Aceflux"),
      value: "Aceflux",
    ),
    DropdownMenuItem(
      child: Text("Grayromantic"),
      value: "Grayromantic",
    ),
    DropdownMenuItem(
      child: Text("Demiromantic"),
      value: "Demiromantic",
    ),
    DropdownMenuItem(
      child: Text("Recipromantic"),
      value: "Recipromantic",
    ),
    DropdownMenuItem(
      child: Text("Akioromantic"),
      value: "Akioromantic",
    ),
    DropdownMenuItem(
      child: Text("Aroflux"),
      value: "Aroflux",
    ),
  ];

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  String _gender;
  String _orientation;

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Next"),
        backgroundColor: Color.fromRGBO(117, 121, 255, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
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
                items: widget._genderList,
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
              DropdownButtonFormField(
                items: widget._orientationList,
                value: _orientation,
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _orientation = value;
                  });
                },
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 30,
                  color: Color.fromRGBO(157, 171, 255, 1),
                ),
                style: TextStyle(color: Colors.grey[800], fontSize: 22),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.face,
                    color: Color.fromRGBO(157, 171, 255, 1),
                  ),
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  labelText: 'Orientation',
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
            ],
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
