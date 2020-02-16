import 'package:flutter/material.dart';

class MainBottomNavBar extends StatelessWidget {
  MainBottomNavBar(
      {Key key, @required int currentPageIndex, @required callback})
      : _currentPageIndex = currentPageIndex,
        _callback = callback,
        super(key: key);

  final _bottomNavBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.dashboard), title: Text("Dashboard")),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Search")),
    BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
  ];
  final int _currentPageIndex;
  final Function(int index) _callback;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _currentPageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _onSelected,
    );
  }

  void _onSelected(int value) {
    _callback(value);
  }
}
