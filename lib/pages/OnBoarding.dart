import 'package:flutter/material.dart';

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
      child: Text("Cis Man"),
      value: "Cis Man",
    ),
    DropdownMenuItem(
      child: Text("Cis Woman"),
      value: "Cis Woman",
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Additional Details"),
      ),
      floatingActionButton:
          FloatingActionButton.extended(onPressed: () {}, label: Text("Next")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name"),
                  TextField(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Age"),
                        TextField(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("City"),
                        TextField(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender"),
                  DropdownButton(
                    items: widget._genderList,
                    value: _gender,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Orientation"),
                  DropdownButton(
                    items: widget._orientationList,
                    value: _orientation,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _orientation = value;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
