import 'package:flutter/material.dart';

class MainDrawerHeader extends StatelessWidget {

  final String name, email;
  final Widget profilePic;
  
  const MainDrawerHeader({Key key, this.name, this.email, this.profilePic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(name),
      accountEmail: Text(email),
      currentAccountPicture: CircleAvatar(
        child: profilePic,
        backgroundColor: Colors.white,
      ),
    );
  }
}
