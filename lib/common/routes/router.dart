
import 'package:flutter/material.dart';
import 'package:mymy/common/routes/routes.dart';
import 'package:mymy/presentation/home/pages/home_page.dart';
import 'package:mymy/presentation/login/pages/login_page.dart';
import 'package:mymy/presentation/not_found/not_found_page.dart';
import 'package:mymy/presentation/splash/pages/splash_page.dart';

abstract class Router{
  static Map<String, WidgetBuilder> routes = {
    Routes.splash:(BuildContext context)=>SplashPage(),
    Routes.login:(BuildContext context)=>LoginPage(),
    Routes.home:(BuildContext context)=>HomePage(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0]!='') {
      return null;
    }
    return null;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context){
        return NotFoundPage();
      },
      );
  }
}