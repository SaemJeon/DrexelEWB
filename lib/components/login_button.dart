import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({this.text, this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        height: 48,
        child: OutlineButton(
          onPressed: onPressed,
          child: Text(text),
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
      ),
    );
  }
}
