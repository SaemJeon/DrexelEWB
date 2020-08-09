import 'package:flutter/material.dart';
import 'package:drexel_ewb/components/login_field.dart';
import 'package:drexel_ewb/components/login_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drexel EWB'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/ewb_logo.JPG'),
                height: 150.0,
              ),
              SizedBox(
                height: 16.0,
              ),
              LoginField(
                hintText: 'Email',
                onSaved: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              LoginField(
                hintText: 'Password',
                onSaved: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 48.0,
              ),
              LoginButton(
                onPressed: () => {
                  _formKey.currentState.save(),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Drexel EWB'),
  //     ),
  //     body: Container(
  //       padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           Image(
  //             image: AssetImage('assets/images/ewb_logo.JPG'),
  //             height: 150.0,
  //           ),
  //           SizedBox(
  //             height: 16.0,
  //           ),
  //           LoginField(
  //             hintText: 'Email',
  //             saveData: _email,
  //           ),
  //           SizedBox(
  //             height: 24.0,
  //           ),
  //           LoginField(
  //             hintText: 'Password',
  //             saveData: _password,
  //           ),
  //           SizedBox(
  //             height: 48.0,
  //           ),
  //           LoginButton(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
