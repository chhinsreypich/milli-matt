// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:western/widgets/chooseLanguages.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  bool _isCheckedKhmer = false;
  bool _isCheckedEnglish = false;
  bool _isCheckedChinese = false;

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
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  setState(() {
                    _isCheckedKhmer = !_isCheckedKhmer;
                    if (_isCheckedKhmer) {
                      _isCheckedEnglish = false;
                      _isCheckedChinese = false;
                    }
                  });
                },
                child: chooseLanguage(
                  '',
                  language: "ភាសាខ្មែរ",
                  flag: "lib/images/flag/kh.png",
                  isChecked: _isCheckedKhmer,
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  setState(() {
                    _isCheckedEnglish = !_isCheckedEnglish;
                    if (_isCheckedEnglish) {
                      _isCheckedKhmer = false;
                      _isCheckedChinese = false;
                    }
                  });
                },
                child: chooseLanguage(
                  '',
                  language: "English",
                  flag: "lib/images/flag/eng.png",
                  isChecked: _isCheckedEnglish,
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  setState(() {
                    _isCheckedChinese = !_isCheckedChinese;
                    if (_isCheckedChinese) {
                      _isCheckedKhmer = false;
                      _isCheckedEnglish = false;
                    }
                  });
                },
                child: chooseLanguage(
                  '',
                  language: "中文",
                  flag: "lib/images/flag/china.png",
                  isChecked: _isCheckedChinese,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
