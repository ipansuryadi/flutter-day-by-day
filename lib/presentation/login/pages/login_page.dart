import 'package:flutter/material.dart';
import 'package:mymy/common/routes/routes.dart';
import 'package:mymy/presentation/splash/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final tokenController = TextEditingController();

  @override
  void dispose() {
    tokenController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isLoggedIn(this.context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Token Here"),
              controller: tokenController,
            ),
            RaisedButton(
              onPressed: _submitForm,
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }

  _printLatestValue() {
    print("::::::::::: ${tokenController.text}");
  }

  void _submitForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appToken', tokenController.text);
    _printLatestValue();
  }

  void _isLoggedIn(context) async {
    String route = await SplashPage.authRoute();
    if(route==Routes.home){
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }
}
