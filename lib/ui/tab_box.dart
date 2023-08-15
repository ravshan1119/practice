import 'package:flutter/material.dart';
import 'package:practice/ui/home_page.dart';
import 'package:practice/ui/second_api_page.dart';
import 'package:practice/ui/third_screen.dart';
class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() =>
      _TabBoxState();
}

class _TabBoxState
    extends State<TabBox> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SecondApiPage(),
    ThirdApiPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'first',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'third',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
