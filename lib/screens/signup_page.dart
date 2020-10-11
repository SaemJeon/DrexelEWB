import 'package:drexel_ewb/components/login_button.dart';
import 'package:flutter/material.dart';
import 'package:drexel_ewb/components/login_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _newFirstName;
  String _newLastName;
  String _newEmail;
  String _newPassword;
  String _newReEnteredPassword;

  Future signUp() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _newEmail, password: _newPassword);
        Navigator.pushNamed(context, '/');
      } catch (e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
        child: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                LoginField(
                  hintText: 'First Name',
                  onSaved: (String value) {
                    _newFirstName = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'First name can\'t be empty' : null,
                ),
                LoginField(
                  hintText: 'Last Name',
                  onSaved: (String value) {
                    _newLastName = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Last name can\'t be empty' : null,
                ),
                LoginField(
                  hintText: 'Email',
                  onSaved: (String value) {
                    _newEmail = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Email can\'t be empty' : null,
                ),
                LoginField(
                  hintText: 'Password',
                  onSaved: (String value) {
                    _newPassword = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please re-enter your password';
                    } else {
                      if (value.length < 6) {
                        return 'Password should be at least 6 characters';
                      }
                    }
                  },
                ),
                LoginField(
                  hintText: 'Re-enter Password',
                  onSaved: (String value) {
                    _newReEnteredPassword = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please re-enter your password';
                    } else {
                      if (_newReEnteredPassword != _newPassword) {
                        return 'Your password doesn\'t match';
                      }
                    }
                  },
                ),
                LoginButton(
                  text: 'Sign Up',
                  onPressed: () {
                    signUp();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
