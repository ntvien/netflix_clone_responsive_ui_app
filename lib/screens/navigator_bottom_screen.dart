import 'package:flutter/material.dart';
import 'package:netflix_responsive_ui_app/screens/home_screen.dart';

class NavigatorBottomScreen extends StatefulWidget {
  @override
  _NavigatorBottomScreenState createState() => _NavigatorBottomScreenState();
}

class _NavigatorBottomScreenState extends State<NavigatorBottomScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey("homeScreen")),
  ];

  final Map<String, IconData> _icons = const {
    "Home": Icons.home,
    "Search": Icons.search,
    "Coming Soon": Icons.queue_play_next,
    "Downloads": Icons.file_download,
    "More": Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: _icons
            .map((title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                      icon: Icon(icon, size: 30), title: Text(title)),
                ))
            .values
            .toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
