import 'package:flutter/material.dart';
import 'package:no_faces/Services.dart';

class GendersScreen extends StatefulWidget {
  @override
  _GendersScreenState createState() => _GendersScreenState();
}

class _GendersScreenState extends State<GendersScreen> {
  String _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                elevation: 5,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Services.genderList.length,
                    itemBuilder: (context, index) => RadioListTile<String>(
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text(Services.genderList[index]),
                        value: Services.genderList[index],
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
