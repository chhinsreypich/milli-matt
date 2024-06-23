import 'package:flutter/material.dart';

import '../../components/logo_login.dart';
import '../../components/my_textfield.dart';
import '../../components/my_textfield_password.dart';

class SignInPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();

   SignInPage({super.key});

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
              
                  const SizedBox (height: 125,),
            
            
                // ICON OF PERSON 
                  const Center(
                    child: Icon(
                          Icons.person,
                          size: 135,
                        ),
                    ),
            
            
                  const SizedBox(height: 40,),
            
            
                // TEXTFIELD OF USERNAME
                  MyTextfield(
                    controller: username,
                    hintText: "Username",
                    obscureText: false,
                  ),
            
            
                  const SizedBox(height: 20,),
            
            
                // TEXTFIELD OF USER PASSWORDS
                  MyTextfieldPassword(
                    controller: password,
                    hintText: "Password",
                    obscureText: true,
                  ),
            
            
                  const SizedBox (height: 4,),
            
            
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
            
            
              const SizedBox(height: 35,),
            
            
                // SIGN IN BUTTON
                Container(
                  padding:const EdgeInsets.all (20.0),
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
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
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
            const SizedBox(height: 35,),
         // OR CONTINUE WITH
              const Padding(
                      padding : EdgeInsets.symmetric(horizontal: 8),
                      child : Row(
                        children: [
                    
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color : Color.fromARGB(255, 35, 44, 35),
                                ),
                              ),
                        
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10),
                                child: Text("or continue with"),
                              ),
            
                              Expanded(
                                child: Divider(
                                  thickness: 0.9,
                                  color : Color.fromARGB(255, 35, 44, 35),
                                ),
                              ),
            
                        ],
                      ),
                  ),
                  
          
                const SizedBox(height : 40),
          
          
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
          
          
                const SizedBox(height: 40,),
          
          
                // NOT HAVE AN ACCOUNT ? REGISTER NOW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          
                      const Text(
                                "Not have an account ?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500
                                ),
                            ),
                    
                      const SizedBox(width : 4),
                    
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signUp');
                          },
                          style: TextButton.styleFrom(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Register Now",
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
                )
            ],
          ),
      ),
    );
  }
}