import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final  controller;
  final String hintText;
  final bool obscureText;

  const MyTextfield({
      super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    
    return  Padding(
                padding: const  EdgeInsets.symmetric(horizontal: 28.0),
                child: TextField(
                  controller : controller,
                  obscureText: obscureText,
               
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                    
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 116, 112, 112),
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      ),

                      fillColor: const Color.fromARGB(207, 238, 249, 244),
                      filled: true,
                      hintText: hintText,

                  ),
                ),
            );
  }
}