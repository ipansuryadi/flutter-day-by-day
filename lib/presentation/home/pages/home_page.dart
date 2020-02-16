import 'package:flutter/material.dart';
import 'package:mymy/presentation/dashboard/pages/dashboard_page.dart';
import 'package:mymy/presentation/home/pages/widgets/main_bottom_nav_bar.dart';
import 'package:mymy/presentation/home/pages/widgets/main_drawer.dart';
import 'package:mymy/presentation/search/pages/search_page.dart';
import 'package:mymy/presentation/settings/pages/settings_page.dart';

enum PageOptions { dashboard, search, settings }

class HomePage extends StatefulWidget {
  final PageOptions page;

  HomePage({Key key, this.page}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex;

  var _pages = [DashboardPage(), SearchPage(), SettingPage()];

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.page?.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Apps'),
      ),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: MainBottomNavBar(
          currentPageIndex: _currentPageIndex, callback: _onTabSelected),
      endDrawer: Drawer(
        child: MainDrawer(callback: _onDrawerMenuSelected),
      ),
    );
  }

  void _onDrawerMenuSelected(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
}
