import 'package:flutter/material.dart';
import 'package:mymy/common/routes/router.dart';
import 'package:mymy/presentation/splash/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Test",
      routes:Router.routes,
      home:SplashPage(),
      onGenerateRoute: Router.onGenerateRoute,
      onUnknownRoute: Router.onUnknownRoute,
      theme:ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepPurple
      )
    );
  }
}