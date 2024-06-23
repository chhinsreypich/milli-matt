import 'package:flutter/material.dart';

import '../../components/logo_login.dart';
import '../../components/my_textfield.dart';
import '../../components/my_textfield_password.dart';

class SignUpPage extends StatelessWidget {

  final Email_PhoneNum = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

   SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A90E2), Color(0xFF50C9C3)], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        child: Column(
          children: [
            
              const SizedBox (height: 120,),
        
        
            // ICON OF PERSON
              const Center(
                child: Icon(
                      Icons.person,
                      size: 135,
                    ),
              ),
        
        
              const SizedBox(height: 40,),
        
        
            // TEXTFIELD OF EMAIL ADDRESS OR PHONE NUMBER
              MyTextfield(
                controller: Email_PhoneNum,
                hintText: "Email address or phone number",
                obscureText: false,
              ),
        
        
              const SizedBox(height: 20,),
        
        
           // TEXTFIELD OF PASSWORD
              MyTextfieldPassword(
                controller: password,
                hintText: "Password",
                obscureText: true,
              ),
        
        
             const SizedBox(height: 20,),
        
        
           // TEXTFIELD OF CONFIRM PASSWORD
              MyTextfieldPassword(
                controller: confirmPassword,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              
        
              const SizedBox(height: 4,),
        
        
          // FORGOT PASSWORD
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          color:  Color.fromARGB(255, 39, 37, 37),
                        ),
                      ),
                  ],
                ),
              ),
        
        
              const SizedBox(height: 33,),
        
        
          // SIGN UP BUTTON
            Container(
                  padding:const EdgeInsets.all (20.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
        
        
              const SizedBox(height: 32,),
        
        
           // OR CONTINUE WITH 
               const  Padding(
                  padding :  EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color : Color.fromARGB(255, 35, 44, 35),
                             ),
                          ),
                  
                          Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 10),
                             child: Text("or continue with"),
                          ),
        
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color : Color.fromARGB(255, 35, 44, 35),
                            ),
                          ),
        
                    ],
                  ),
                ),
                
        
              const SizedBox(height : 23),
        
        
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
        
                  // LOGIN WITH GOOGLE ACCOUNT
                     Logo_Login(
                        image_Logo: "lib/images/introPic/Google_Logo.png",
                     ),
                    
                     SizedBox(width:31,),
        
                  // LOGIN WITH FACEBOOK ACCOUNT
                     Logo_Login(
                        image_Logo: "lib/images/introPic/Facebook_Logo.png",
                     ),
              
                    SizedBox(width:31,),
                
                  // LOGIN WITH APPLE ID 
                     Logo_Login(
                        image_Logo: "lib/images/introPic/Apple_Logo.png",
                     ),
        
                 ],
               ),
        
        
              const SizedBox(height: 30,),
        
        
              // ALREADY HAVE AN ACCOUNT ? SIGN IN 
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
        
                    const Text(
                              "Already have an account ?",
                              style: TextStyle(
                                fontWeight: FontWeight.w500
                              ),
                           ),
                  
                    const SizedBox(width : 4),
                   
                   // TAP TO SIGN IN 
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signIn');
                          },
                          style: TextButton.styleFrom(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color.fromARGB(255, 21, 62, 127),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                 ],
              ),
        
          ],
        ),
      ),
    );
  }
}