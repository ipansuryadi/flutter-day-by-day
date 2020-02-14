import 'package:flutter/material.dart';
import 'package:mymy/common/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();

  static Future<String> authRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkToken = prefs.containsKey('appToken');
    String route = Routes.login;
    if (checkToken) {
      route = Routes.home;
    }
    return route;
  }
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    _nextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/bunga.png'),
          Text("Video\nApp",textAlign: TextAlign.center,)
      ],),
    );
  }

  void _nextPage() async {
    String route = await SplashPage.authRoute();
    Future.delayed(Duration(seconds: 1),
        () => Navigator.of(context).pushReplacementNamed(route));
  }
}
