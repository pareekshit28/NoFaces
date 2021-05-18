import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/pages/Favorites.dart';
import 'package:no_faces/pages/ProfileScreen.dart';
import 'package:no_faces/pages/Today.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> _children = [Today(), Favorites(), ProfileScreen()];

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
      appBar: _selectedIndex != 2
          ? AppBar(
              elevation: 10,
              title: Text("NoFaces"),
              centerTitle: true,
              backgroundColor: _selectedIndex == 0 ? Colors.blue : Colors.pink,
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(20, 20, 20, 1),
        elevation: 10,
        unselectedItemColor: Color.fromRGBO(100, 100, 100, 1),
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Today"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: widget._children[_selectedIndex],
    );
  }
}
