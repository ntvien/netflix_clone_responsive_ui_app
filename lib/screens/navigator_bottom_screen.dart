import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_responsive_ui_app/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_responsive_ui_app/screens/home_screen.dart';
import 'package:netflix_responsive_ui_app/widgets/responsive.dart';

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
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
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
            )
          : null,
    );
  }
}
