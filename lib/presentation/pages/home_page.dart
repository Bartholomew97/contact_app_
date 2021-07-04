
import 'package:flutter/material.dart';

import 'contact_code_page.dart';
import 'contacts_page.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {

  final List<Widget> _children = [
    ContactsPage(),
    ContactCodePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green[900],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'User'
          )
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
    );
  }
}