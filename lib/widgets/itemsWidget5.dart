// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:western/widgets/navBar.dart';

class ItemsWidget5 extends StatefulWidget {
  @override
  State<ItemsWidget5> createState() => _ItemsWidget5State();
}

final List<String> options = [
  "Normal Sugar",
  "Less Sugar",
  "More Sugar",
  "No Sugar",
];

class _ItemsWidget5State extends State<ItemsWidget5> {
  @override
  int quantityCount = 1;

  // decrement quatity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) {
        quantityCount--;
      }
    });
  }

  // increment Quatity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    // if(quantityCount > 0)

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black54.withOpacity(0.6),
        insetPadding: EdgeInsets.only(top: 20),
        title: Text(
          "Sucessfully added to cart",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                // pop to show bottom page
                Navigator.pop(context);
                // pop to menu page
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }

  String currentOption = options[0];

  // List of item names
  final List<String> itemNames = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "Olatte",
    "Sprite",
    "Pepsi",
    "Coke",
    "22",
  ];

  final List<String> description = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "Special Olatte",
    "Sprite, boost your mood",
    "With Pepsi, everything is yummy",
    "Coke, Make your food more delicious",
    "22",
  ];

  final List<String> price = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "\$0.65",
    "\$0.65",
    "\$0.65",
    "\$1.00",
    "22",
  ];

  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.70,
      children: [
        for (int i = 17; i < 21; i++)
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      0.1,
                    ),
                    spreadRadius: 1,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  //1

                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'singleItemPage');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        "lib/images/drinks/${i + 1}.png",
                        width: 120,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 2),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        itemNames[i],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description[i],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // To make the row fit its content
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:  Color.fromARGB(255, 106, 132, 173),
                            borderRadius: BorderRadius.circular(
                                18), // Circular shape with radius 18
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.2), // Shadow color with opacity
                                spreadRadius: 2, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: Offset(0, 3), // Offset of the shadow
                              ),
                            ],
                          ),
                          height: 35,
                          width: 55,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 2),
                            child: Text(
                              price[i],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            /// bottom sheet pop up
                            customShowBottomSheet(context, i);
                          },
                          icon: const Icon(Icons.add),
                          style: IconButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 195, 244, 228)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  PersistentBottomSheetController customShowBottomSheet(
      BuildContext context, int i) {
    return showBottomSheet(
        context: context,
        // barrierColor: Colors.black26.withOpacity(0.8),
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 550,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),

                /// coffee name in sheet bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemNames[i],
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                //// we add radio here
                //// but drink no need sugar

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// show price in bottom sheet
                    Text(
                      price[i],
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      child: Row(
                        children: [
                          /// remove icon butoon
                          IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(
                              Icons.remove_circle_outline_outlined,
                              color: const Color.fromARGB(255, 120, 116, 116),
                              size: 30,
                            ),
                          ),

                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),

                          // add icon button
                          IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(
                              Icons.add_circle,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: addToCart,
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}