// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:western/pages/Order/trackOrder.dart'; // Ensure this import is correct

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> orderItems;

  PaymentPage({required this.orderItems});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isCashSelected = false;
  bool isCreditCardSelected = false;

  double calculateItemTotalPrice(int index) {
    double price = double.parse(widget.orderItems[index]['price'].substring(1)); 
    return price * widget.orderItems[index]['quantity'];
  }

  double calculateTotal() {
    double total = 0;
    for (var item in widget.orderItems) {
      double price = double.parse(item['price'].substring(1));
      total += price * item['quantity'];
    }
    return total;
  }

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
        backgroundColor:
            Colors.transparent, 
        appBar: AppBar(
          backgroundColor:
              Colors.transparent, 
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
            iconSize: 35,
          ),
          title: Container(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              "Confirm Order",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 2, left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.blue],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  height: 4,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Your Bill Summary",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 5),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < widget.orderItems.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${widget.orderItems[i]['name']} x${widget.orderItems[i]['quantity']}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "\$${calculateItemTotalPrice(i).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "\$${calculateTotal().toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "-\$0.00", // Update this value as per the coupon discount logic
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$${calculateTotal().toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    "Payment Method",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                // Payment Method
                Container(
                  margin: EdgeInsets.all(5),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10), // Adjust the padding as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.attach_money_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Cash Payment",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                shape: CircleBorder(),
                                value: isCashSelected,
                                onChanged: (value) {
                                  setState(() {
                                    isCashSelected = value!;
                                    if (isCashSelected) {
                                      isCreditCardSelected =
                                          false; // Uncheck Credit Card if Cash is selected
                                    }
                                  });
                                },
                                activeColor: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        //row 2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.credit_card,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Credit Card / Acleda Bank",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                shape: CircleBorder(),
                                value: isCreditCardSelected,
                                onChanged: (value) {
                                  setState(() {
                                    isCreditCardSelected = value!;
                                    if (isCreditCardSelected) {
                                      isCashSelected =
                                          false; // Uncheck Cash if Credit Card is selected
                                    }
                                  });
                                },
                                activeColor: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 86, 80, 80)
                            .withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pin_drop_sharp,
                              color: const Color.fromARGB(255, 215, 200, 200),
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                " Pick Up At LU Coffee",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 228, 221, 221),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: Offset(210, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 220),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrackOrder(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20), // Adjust padding
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text(
                            'Place Order',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color : const Color.fromARGB(255, 51, 102, 190),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}