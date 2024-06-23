// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:western/widgets/editItem.dart';
import 'package:western/widgets/textFieldWtihStyle.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String gender = "man";

  String userInputFname = '';
  String userInputLname = '';
  String userInputAge = '';
  String userInputEmail = '';
  String userInputContact = '';

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _age = TextEditingController();
  final _email = TextEditingController();
  final _contact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 51, 104, 165), Color.fromARGB(255, 61, 149, 145)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    ///// for profile text at the top (or app bar)
                    const SizedBox(width: 120),
                    Text(
                      "Account",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                EditItem(
                  title: "Photo",
                  widget: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image.asset(
                              "lib/images/profile.jpg",
                              height: 130,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.lightBlueAccent,
                        ),
                        child: Text(
                          "Upload Image",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                EditItem(
                  widget: textFieldWithStyle(
                    hintText: "First Name",
                    lastName: _firstName,
                  ),
                  title: " First Name",
                ),
                const SizedBox(height: 40),
                EditItem(
                  widget: textFieldWithStyle(
                    hintText: "Last Name",
                    lastName: _lastName,
                  ),
                  title: " Last Name",
                ),
                const SizedBox(height: 40),
                EditItem(
                  title: "Gender",
                  widget: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            gender = "man";
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: gender == "man"
                              ? Colors.deepPurple
                              : Colors.grey.shade200,
                          fixedSize: const Size(70, 70),
                        ),
                        icon: Icon(
                          Ionicons.male,
                          color: gender == "man" ? Colors.white : Colors.black,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            gender = "woman";
                          });
                        },
                        style: IconButton.styleFrom(
                            backgroundColor: gender == "woman"
                                ? Colors.deepPurple
                                : Colors.grey.shade200,
                            fixedSize: const Size(70, 70)),
                        icon: Icon(
                          Ionicons.female,
                          color:
                              gender == "woman" ? Colors.white : Colors.black,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                EditItem(
                  widget: textFieldWithStyle(
                    hintText: "Age",
                    lastName: _age,
                  ),
                  title: "Age",
                ),
                const SizedBox(height: 40),
                EditItem(
                  widget: textFieldWithStyle(
                    hintText: "Email",
                    lastName: _email,
                  ),
                  title: "Email",
                ),
                const SizedBox(height: 40),
                EditItem(
                  widget: textFieldWithStyle(
                    hintText: "Phone Number",
                    lastName: _contact,
                  ),
                  title: "Phone Number",
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          userInputFname = _firstName.text;
                          userInputLname = _lastName.text;
                          userInputAge = _age.text;
                          userInputContact = _contact.text;
                        });

                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      padding: EdgeInsets.all(18),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}