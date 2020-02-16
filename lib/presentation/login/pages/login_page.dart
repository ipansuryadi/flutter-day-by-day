import 'package:flutter/material.dart';
import 'package:mymy/common/routes/routes.dart';
import 'package:mymy/data/auth/datasources/auth_local_datasource.dart';
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

  void _submitForm() async {
    final authLocalDatasourceImpl =
        AuthLocalDatasourceImpl(await SharedPreferences.getInstance());
    authLocalDatasourceImpl.setToken('appToken', tokenController.text);
    _isLoggedIn(context);
  }

  void _isLoggedIn(context) async {
    final authLocalDatasourceImpl =
        AuthLocalDatasourceImpl(await SharedPreferences.getInstance());
    final token = authLocalDatasourceImpl.getToken('appToken');
    if (token != null) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }
}
