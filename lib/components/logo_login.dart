import 'package:flutter/material.dart';

class Logo_Login extends StatelessWidget {

  final String image_Logo;

   const Logo_Login({
      super.key,
      required this.image_Logo,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
     
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white,),
          borderRadius: BorderRadius.circular(16),
          color:  const Color.fromARGB(207, 238, 244, 240),
    
      ),
      child: Image.asset(
        image_Logo,
        height: 43,
      
      ),
    );
  }
}