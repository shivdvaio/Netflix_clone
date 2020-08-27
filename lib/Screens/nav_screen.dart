export 'home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/Screens/home_screen.dart';

class NavScreeen extends StatefulWidget {
  @override
  _NavScreeenState createState() => _NavScreeenState();
}

class _NavScreeenState extends State<NavScreeen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  final Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Search': Icons.search,
    'Comming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => _currentIndex = index),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          selectedFontSize: 11,
          unselectedFontSize: 11.0,
          unselectedItemColor: Colors.grey,
          items: _icons
              .map((title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    title: Text(title),
                    icon: Icon(
                      icon,
                      size: 30,
                    ),
                  )))
              .values
              .toList()),
      body: _screens[_currentIndex],
    );
  }
}
