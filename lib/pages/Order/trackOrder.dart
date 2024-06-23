// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4A90E2), Color(0xFF50C9C3)], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Tracking Order",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              const Center(
                child: Text(
                  'Order Number: #12345',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Estimate Preparing Time',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const LinearProgressIndicator(
                      backgroundColor: Color.fromARGB(255, 200, 192, 192),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text(
                  '5 - 10 mins',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                    radius: 24,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Status',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'LU Coffee',
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Text(
                        '9.5 (100+ ratings)',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView(
                  children: [
                    _buildTimelineTile(
                      context,
                      time: '8:00 AM',
                      title: 'Order Placed',
                      description: 'Your order #12345 was placed for delivery.',
                      isCompleted: true,
                    ),
                    _buildTimelineTile(
                      context,
                      time: '8:15 AM',
                      title: 'Pending',
                      description: 'Your order is pending for confirmation.',
                      isCompleted: true,
                    ),
                    _buildTimelineTile(
                      context,
                      time: '8:30 AM',
                      title: 'Confirmed',
                      description: 'Your order is confirmed and will be ready soon.',
                      isCompleted: true,
                    ),
                    _buildTimelineTile(
                      context,
                      time: '8:45 AM',
                      title: 'Processing',
                      description: 'Your product is ready for picked up.',
                      isCompleted: false,
                    ),
                    _buildTimelineTile(
                      context,
                      time: '9:00 AM',
                      title: 'Delivered',
                      description: 'Product delivered to you and marked as delivered.',
                      isCompleted: false,
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 5), 
              Padding(
                padding: const EdgeInsets.only(bottom : 30.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _showConfirmationDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromARGB(255, 51, 102, 190),
                      ),
                      child: const Text('Confirm Pick Up'),
                    ),
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const OrderServedMessage();
      },
    );
  }

  Widget _buildTimelineTile(
    BuildContext context, {
    required String time,
    required String title,
    required String description,
    required bool isCompleted,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: isCompleted ? Colors.green : const Color.fromARGB(255, 221, 213, 213),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 228, 219, 219),
                  ),
                ),
              ),
              if (!isCompleted)
                Container(
                  height: 40,
                  width: 2,
                  color: const Color.fromARGB(255, 200, 192, 192),
                ),
            ],
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 60, 58, 58),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 238, 233, 233)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderServedMessage extends StatelessWidget {
  const OrderServedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text("Order Served"),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.52,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/final.png',
                width: 200,
                height: 400,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5),
              const Text(
                "Your order has already been served. Thank you :)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 82, 102, 111),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              "Back to Home",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 119, 83, 182),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
        ],
      ),
    );
  }
}