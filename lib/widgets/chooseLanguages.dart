// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class chooseLanguage extends StatelessWidget {
  final String language;
  final String flag;
  // final VoidCallback onTap;
  final bool isChecked;
  const chooseLanguage(
    String s, {
    super.key,
    required this.language,
    required this.flag,
    // required this.onTap,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(flag),
        ),
        SizedBox(width: 20),
        Text(
          language,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Expanded(child: SizedBox()),
        // onTap == true ? Icon(Icons.check) : SizedBox(width: 10,),
        if (isChecked)
          Icon(
            Icons.check,
            color: Colors.white,
          ),
        const SizedBox(width: 20),
      ],
    );
  }
}
