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
  String newFirstName;
  String newLastName;
  String newEmail;
  String newPassword;
  String newReEnteredPassword;

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
                    setState(() {
                      newFirstName = value;
                    });
                  },
                  validator: (value) =>
                      value.isEmpty ? 'First name can\'t be empty' : null,
                ),
                LoginField(
                  hintText: 'Last Name',
                  onSaved: (String value) {
                    setState(() {
                      newLastName = value;
                    });
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Last name can\'t be empty' : null,
                ),
                LoginField(
                  hintText: 'Email',
                  onSaved: (String value) {
                    setState(() {
                      newEmail = value;
                    });
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Email can\'t be empty' : null,
                ),
                LoginField(
                  hintText: 'Password',
                  onSaved: (String value) {
                    setState(() {
                      newPassword = value;
                    });
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Passowrd can\'t be empty' : null,
                ),
                LoginField(
                  hintText: 'Re-enter Password',
                  onSaved: (String value) {
                    setState(() {
                      newReEnteredPassword = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please re-enter your password';
                    } else {
                      if (newReEnteredPassword != newPassword) {
                        return 'Your password doesn\'t match';
                      }
                    }
                  },
                ),
                LoginButton(
                  text: 'Sign Up',
                  onPressed: () {
                    _formKey.currentState.save();
                    print(newPassword);
                    if (_formKey.currentState.validate()) {
                      Navigator.pop(context);
                    }
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

// body: Container(
//         padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               LoginField(
//                 hintText: 'First Name',
//                 onSaved: (String value) {
//                   setState(() {
//                     newFirstName = value;
//                   });
//                 },
//                 validator: (value) =>
//                     value.isEmpty ? 'First name can\'t be empty' : null,
//               ),
//               LoginField(
//                 hintText: 'Last Name',
//                 onSaved: (String value) {
//                   setState(() {
//                     newLastName = value;
//                   });
//                 },
//                 validator: (value) =>
//                     value.isEmpty ? 'Last name can\'t be empty' : null,
//               ),
//               LoginField(
//                 hintText: 'Email',
//                 onSaved: (String value) {
//                   setState(() {
//                     newEmail = value;
//                   });
//                 },
//                 validator: (value) =>
//                     value.isEmpty ? 'Email can\'t be empty' : null,
//               ),
//               LoginField(
//                 hintText: 'Password',
//                 onSaved: (String value) {
//                   setState(() {
//                     newPassword = value;
//                   });
//                 },
//                 validator: (value) =>
//                     value.isEmpty ? 'Passowrd can\'t be empty' : null,
//               ),
//               LoginField(
//                 hintText: 'Re-enter Password',
//                 onSaved: (String value) {
//                   setState(() {
//                     newReEnteredPassword = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please re-enter your password';
//                   } else {
//                     if (newReEnteredPassword != newPassword) {
//                       return 'Your password doesn\'t match';
//                     }
//                   }
//                 },
//               ),
//               LoginButton(
//                 text: 'Sign In',
//                 onPressed: () {
//                   _formKey.currentState.save();
//                   print(newPassword);
//                   if (_formKey.currentState.validate()) {
//                     Navigator.pop(context);
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
