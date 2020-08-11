import 'package:drexel_ewb/arguments.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:drexel_ewb/components/login_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, '/');
    } catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final FirebaseUser user = args.user;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home ${user.email}'),
      ),
      body: Container(
        child: LoginButton(
          text: 'Sign Out',
          onPressed: () {
            signOut();
          },
        ),
      ),
    );
  }
}
