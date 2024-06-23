// import 'package:carousel_slider/carousel_slider.dart';
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import '../components/eventsTile.dart';
import '../components/imageCarousel.dart';
import '../components/sectionTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final Uri websiteUrl = Uri.parse('https://lifeun.edu.kh');

  //website access
  Future<void> _launchURL() async {
    if (!await launch(websiteUrl.toString())) {
      throw 'Could not launch $websiteUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var defaultPadding = screenSize.width * 0.03;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 51, 104, 165), Color.fromARGB(255, 61, 149, 145)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: screenSize.height * 0.12,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(
                    left: defaultPadding,
                    top: screenSize.height * 0.06,
                    right: defaultPadding / 2,
                    bottom: defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hello, Oliva!",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: screenSize.width * 0.07,
                            color: Color.fromARGB(255, 239, 239, 244),
                          ),
                        ),
                        
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Color.fromARGB(255, 239, 239, 244),
                            size: screenSize.width * 0.08,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/notification");
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children :[
                        Text(
                            "What do you want to have today? :)",
                            style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              color: Color.fromARGB(255, 239, 239, 244),
                              fontWeight : FontWeight.w500,
                            ),
                        ),
                      
                      ],
                    ),
                    
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Icon(
                    //       Icons.pin_drop,
                    //       size: screenSize.width * 0.05,
                    //       color: Colors.white38,
                    //     ),
                    //     Text(
                    //       " lu café (near conference room)",
                    //       style: TextStyle(
                    //         color: Colors.white38,
                    //         fontSize: screenSize.width * 0.04,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: screenSize.height * 0.01),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Icon(
                    //       Icons.timer,
                    //       size: screenSize.width * 0.05,
                    //       color: Colors.white38,
                    //     ),
                    //     Text(
                    //       " Preparing time 5-10mns",
                    //       style: TextStyle(
                    //         color: Colors.white38,
                    //         fontSize: screenSize.width * 0.04,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              sliver: SliverToBoxAdapter(
                child: ImageCarousel(),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      "Recommended Drinks",
                      style: TextStyle(
                        fontSize: screenSize.width * 0.05,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 255, 249, 249),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SectionTile(),
            ),

            SliverPadding(
              padding: EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Life University & FC Events",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 255, 249, 249),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "see more",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 50, 28, 101),
                          ),
                        ),
                        onPressed: _launchURL,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: EventsTile(),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Color.fromARGB(255, 47, 116, 146),
          color: Color.fromARGB(255, 45, 137, 167),
          animationDuration: Duration(milliseconds: 300),
          items: <Widget>[
            Icon(
              Icons.home,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
            Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
            Icon(
              Icons.list_alt_rounded,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
            switch (index) {
              case 0:
                // homepage
                break;
              case 1:
                Navigator.pushNamed(context, '/menu');
                break;
              case 2:
                // Navigator.pushNamed(context, '/cart');
                break;
              case 3:
                Navigator.pushNamed(context, '/order');
                break;
              case 4:
                Navigator.pushNamed(context, '/account');
                break;
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}