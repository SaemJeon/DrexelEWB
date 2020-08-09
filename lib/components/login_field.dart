import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  LoginField({this.hintText, this.onSaved});

  final String hintText;
  final Function onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onSaved: onSaved,
    );
  }
}
