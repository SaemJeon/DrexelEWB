import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  LoginField({this.hintText, this.onSaved, this.validator});

  final String hintText;
  final Function onSaved;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: false,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
