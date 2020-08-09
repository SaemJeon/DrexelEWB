import 'package:flutter/material.dart';
import 'package:drexel_ewb/screens/login_page.dart';
import 'package:drexel_ewb/screens/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
