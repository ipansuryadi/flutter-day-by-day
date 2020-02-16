import 'package:flutter/material.dart';
import 'package:mymy/common/routes/routes.dart';
import 'package:mymy/presentation/home/pages/widgets/main_drawer_header.dart';

typedef DrawerCallback = Function(int index);

class MainDrawer extends StatefulWidget {
  final DrawerCallback callback;

  MainDrawer({Key key, @required this.callback}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainDrawerHeader(
          name: "Ipan Suryadi",
          email: "ipansuryadi@gmail.com",
          profilePic: FlutterLogo(
            size: 42,
          ),
        ),
        ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings),
          onTap: _showSettingPage,
        ),
        ListTile(
          title: Text("About"),
          leading: Icon(Icons.info),
          onTap: () => Navigator.of(context).pushNamed(Routes.about),
        ),
      ],
    );
  }

  void _showSettingPage() {
    widget.callback(2);
    Navigator.of(context).pop();
  }
}
