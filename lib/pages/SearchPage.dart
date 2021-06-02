import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<String> _list = [
    "Electronic Music",
    "Pop",
    "Anime",
    "Korean Drama",
    "Bollywood",
    "K-Pop",
    "Manga",
    "Sufi",
    "Hollywood",
    "Die Hard",
    "Brooklyn nine-nine",
    "Rap",
    "Friends",
    "Flutter",
    "Android",
    "The Office",
    "Coffee",
    "Tea"
  ];
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    List<ChoiceChip> _tagList = [];
    widget._list.forEach((element) {
      _tagList.add(ChoiceChip(
        side: BorderSide(
            width: 1.5,
            color: _selected == true ? Colors.lightBlueAccent : Colors.black12),
        backgroundColor: Colors.transparent,
        label: Text(element),
        selected: _selected,
        onSelected: (value) {
          setState(() {
            _selected = value;
          });
        },
      ));
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Find People"),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: Text("Submit")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select atmost 5 tags"),
              SizedBox(height: 20),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(hintText: "Search tags"),
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Wrap(
                  spacing: 5,
                  children: _tagList,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
