import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({this.email, this.password, this.onPressed});

  final String email;
  final String password;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      height: 48,
      child: OutlineButton(
        onPressed: onPressed,
        child: Text('Login'),
        textColor: Colors.grey,
        highlightedBorderColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
    );
  }
}
