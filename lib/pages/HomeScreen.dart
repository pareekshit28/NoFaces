import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/pages/Favorites.dart';
import 'package:no_faces/pages/Today.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> _children = [Today(), Favorites()];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("NoFaces"),
        centerTitle: true,
        backgroundColor: _selectedIndex == 0 ? Colors.blue : Colors.pink,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                color: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            "https://img.buzzfeed.com/buzzfeed-static/static/2021-02/5/20/asset/cb4b9aaeff63/sub-buzz-1897-1612557676-39.png?crop=933%3A793%3B142%2C0&resize=475%3A%2A"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Rachel Green"),
                            Icon(CupertinoIcons.right_chevron)
                          ],
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: _selectedIndex == 0 ? Colors.blue : Colors.pink,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Today"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorites")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: widget._children[_selectedIndex],
    );
  }
}
