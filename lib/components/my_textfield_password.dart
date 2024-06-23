import 'package:flutter/material.dart';

class MyTextfieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextfieldPassword({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<MyTextfieldPassword> createState() => _MyTextfieldPasswordState();
}

class _MyTextfieldPasswordState extends State<MyTextfieldPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,

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
                      hintText: widget.hintText,

                      suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility), // change icon based on state
                          onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText; // toggle state
                              });
                          },
                      ),

        ),
      ),
    );
  }
}