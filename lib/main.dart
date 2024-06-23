
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:western/pages/IntroPage/signInPage.dart';
import 'package:western/pages/IntroPage/signUpPage.dart';
import 'package:western/pages/Order/PaymentPage.dart';
import 'package:western/pages/languages.dart';
import 'package:western/pages/menu.dart';
import 'package:western/pages/notificationPage.dart';
import 'package:western/pages/Order/order.dart';
import 'package:western/pages/profile.dart';
import 'package:western/pages/Order/trackOrder.dart';
import 'pages/IntroPage/introPage.dart';

import 'pages/IntroPage/signInPage.dart';
import 'pages/changePw.dart';
import 'pages/homePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route to the IntroPage
      routes: {
        "/": (context) => IntroPage(), // Show IntroPage first
        '/home': (context) => HomePage(),
        '/menu': (context) => MenuPage(),
        '/notification': (context) => Notificationpage(),
        "/order": (context) => OrderPage(),
        "/payment": (context) => PaymentPage(orderItems: [],),
        "/trackOrder": (context) => TrackOrder(),
        "/account": (context) => ProfilePage(),
        "/signIn": (context) => SignInPage(), 
        "/signUp": (context) => SignUpPage(), 
        "/changePw": (context) => ChangePassword(), 
        "/languages": (context) => Languages(), 
      },
    );
  }
}


// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:western/pages/IntroPage/signUpPage.dart';
// import 'package:western/pages/Order/PaymentPage.dart';
// import 'package:western/pages/languages.dart';
// import 'package:western/pages/menu.dart';
// import 'package:western/pages/notificationPage.dart';
// import 'package:western/pages/Order/order.dart';
// import 'package:western/pages/profile.dart';
// import 'package:western/pages/Order/trackOrder.dart';
// import 'pages/IntroPage/introPage.dart';

// import 'pages/IntroPage/signInPage.dart';
// import 'pages/changePw.dart';
// import 'pages/homePage.dart';



// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/', // Set the initial route to the IntroPage
//       routes: {
//         "/": (context) => IntroPage(), // Show IntroPage first
//         '/home': (context) => HomePage(),
//         '/menu': (context) => MenuPage(),
//         '/notification': (context) => Notificationpage(),
//         "/order": (context) => OrderPage(),
//         "/payment": (context) => PaymentPage(
//               orderItems: [],
//             ),
//         "/trackOrder": (context) => TrackOrder(),
//         "/account": (context) => ProfilePage(),
//         "/signIn": (context) => SignInPage(), 
//         "/signUp": (context) => SignUpPage(), 
//         "/changePw": (context) => ChangePassword(), 
//         "/languages": (context) => Languages(), 
//       },
//     );
//   }
// }
