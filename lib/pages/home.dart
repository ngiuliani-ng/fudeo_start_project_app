import 'package:flutter/material.dart';

import 'last_hour.dart';
import 'old.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  bool _currentTheme = true;

  void onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
      print("Selected Page: $_currentPageIndex");
    });
  }

  void onThemeChanged() {
    setState(() {
      _currentTheme = !_currentTheme;
      print("Selected Theme: $_currentTheme");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: _currentTheme
              ? Icon(
                  Icons.wb_sunny_rounded,
                  color: Colors.amber.shade600,
                )
              : Icon(
                  Icons.nightlight_round,
                  color: Colors.yellow.shade600,
                ),
          onPressed: onThemeChanged,
        ),
        title: Text("News"),
        centerTitle: true,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          LastHourPage(),
          OldPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        elevation: 0,
        onTap: (int index) {
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: "Last Hour",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_rounded),
            label: "Old",
          ),
        ],
      ),
    );
  }
}
