// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class textFieldWithStyle extends StatelessWidget {
  const textFieldWithStyle({
    super.key,
    required TextEditingController lastName, 
    required this.hintText,
  }) : _lastName = lastName;

  final TextEditingController _lastName;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _lastName,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: UnderlineInputBorder( 
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            /// clear whats currently in the text field
            _lastName.clear();
          },
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
