import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:drexel_ewb/components/login_field.dart';
import 'package:drexel_ewb/components/login_button.dart';
import 'package:drexel_ewb/constants.dart';
import 'package:drexel_ewb/arguments.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  Future signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.pushReplacementNamed(context, '/home',
            arguments: ScreenArguments(user: user));
      } catch (e) {
        print(e.message);
      }
    }
  }

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/ewb_logo.JPG'),
                height: 150.0,
              ),
              LoginField(
                hintText: 'Email',
                onSaved: (String value) {
                  _email = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Email can\'t be empty' : null,
              ),
              LoginField(
                hintText: 'Password',
                onSaved: (String value) {
                  _password = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Passowrd can\'t be empty' : null,
              ),
              SizedBox(
                height: 24.0,
              ),
              LoginButton(
                text: 'Sign In',
                onPressed: () {
                  signIn();
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Don\'t have an account? '),
                      TextSpan(
                          text: 'Sign Up',
                          style: kLoginLinkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/signup');
                            })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
