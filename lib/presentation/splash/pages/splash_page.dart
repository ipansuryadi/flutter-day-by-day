import 'package:flutter/material.dart';
import 'package:mymy/common/routes/routes.dart';
import 'package:mymy/data/auth/datasources/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();


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
          Text(
            "Video\nApp",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  void _nextPage() async {
    final String token = AuthLocalDatasourceImpl(await SharedPreferences.getInstance())
        .getToken('appToken');
    String route = token != null ? Routes.home : Routes.login;
    Future.delayed(Duration(seconds: 1),
        () => Navigator.of(context).pushReplacementNamed(route));
  }
}
