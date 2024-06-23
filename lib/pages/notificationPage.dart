// 

// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:western/pages/notificationDetialPage.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'name': 'MK', //Ronaldo
        'description':
            'Your order has been placed. Please be patient; the shop is preparing your order.'
      },
      {
        'name': 'Olivia', //Michael
        'description':
            'Your order is being processed. We will notify you when it is ready.'
      },
      {
        'name': 'Joe', //Jennie
        'description':
            'Your order is ready for pickup. Please collect it at your convenience.'
      },
    ];
    final List<String> profile = [
      'images/profile/ronaldo.png',
      'images/profile/michael.png',
      'images/profile/jennie.png'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 16,
                            backgroundImage: AssetImage(profile[index])),
                        SizedBox(width: 12),
                        Text(
                          notifications[index]['name']!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      notifications[index]['description']!,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotiDetailPage(
                          orderName: notifications[index]['name']!),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}