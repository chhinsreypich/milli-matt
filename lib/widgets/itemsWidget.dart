// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

final List<String> options = [
  "Normal Sugar",
  "Less Sugar",
  "More Sugar",
  "No Sugar",
];

class _ItemsWidgetState extends State<ItemsWidget> {
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

  // List of item names
  final List<String> itemNames = [
    "Iced Cappucino",
    "Iced Latte",
    "Iced Americano",
    "Iced Mocha",
    "Iced Vanilla Latte",
    "Iced Caramel",
    "HazeLnut Latte",
  ];

  final List<String> description = [
    "Equal parts espresso, steamed milk, and milk foam",
    "Espresso with chilled milk over ice",
    "Espresso diluted with hot water for a smooth taste",
    "Espresso mixed with steamed milk and choco",
    "Espresso with steamed milk and vanilla syrup",
    "Espresso with steamed milk and syrup",
    "Espresso with steamed milk and  hazelnut syrup",
  ];

  final List<String> price = [
    "\$1.50",
    "\$1.75",
    "\$1.25",
    "\$2.00",
    "\$1.75",
    "\$1.75",
    "\$2.50",
  ];

  String currentOption = options[0];

  PersistentBottomSheetController customShowBottomSheet(
      BuildContext context, int i) {
    return showBottomSheet(
        context: context,
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

                /// sugar level selection
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sugar Level",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Optional (+\$0.00)",
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 114, 112, 112),
                          ),
                        )
                      ],
                    ),
                    ListTile(
                      title: Text(
                        'Normal Sugar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      leading: Radio<String>(
                          value: options[0],
                          groupValue: currentOption,
                          // activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                            });
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'Less Sweet',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      leading: Radio<String>(
                          value: options[1],
                          groupValue: currentOption,
                          // activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                            });
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'More Sweet',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      // Set Radio<String> using _color, set value to 'Red', and set activeColor to red
                      leading: Radio<String>(
                          value: options[2],
                          groupValue: currentOption,
                          // activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                            });
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'No Sweet',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      // Set Radio<String> using _color, set value to 'Red', and set activeColor to red
                      leading: Radio<String>(
                          value: options[3],
                          groupValue: currentOption,
                          // activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                            });
                          }),
                    ),
                  ],
                ),

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
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      child: Row(
                        children: [
                          /// remove icon butoon
                          IconButton(
                            onPressed: () {
                              setState(() {
                                decrementQuantity();
                              });
                            },
                            icon: Icon(
                              Icons.remove_circle,
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
                            onPressed: () {
                              setState(() {
                                incrementQuantity();
                              });
                            },
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
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      backgroundColor: const Color.fromARGB(255, 120, 125, 121),
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

//items and description
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.70,
      children: [
        for (int i = 0; i < 7; i++)
          Container(
            padding : EdgeInsets.symmetric (vertical : 5, horizontal : 10),
            margin : EdgeInsets.symmetric(vertical : 7, horizontal : 15),
            decoration : BoxDecoration(
              borderRadius: BorderRadius.circular (20),
              color : Colors.black12,
              boxShadow: [
                BoxShadow(
                  color : Colors.black.withOpacity(0.1,),
                  spreadRadius : 1,
                  blurRadius : 8,
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
                      width: 130,
                      height: 130,
                      fit: BoxFit.contain, //// contain => kom oy dach pic
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding : EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        margin : EdgeInsets.symmetric(vertical: 7),
                        decoration : BoxDecoration(
                          borderRadius : BorderRadius.circular(20),
                          color: Color.fromARGB(255, 106, 132, 173),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                              spreadRadius: 2, // Spread radius
                              blurRadius: 5, // Blur radius
                              offset: Offset(0, 3), //
                            ),
                          ],
                        ),
                        height: 37,
                        // width: 60,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 2),
                          child: Text(
                            price[i],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                          width: 8
                      ), 

                      IconButton(
                        onPressed: () {
                          customShowBottomSheet(context, i);
                        },
                        icon: const Icon(Icons.add),
                        style: IconButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 195, 244, 228)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class iconbutton extends StatelessWidget {
  const iconbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.remove_circle,
      color: const Color.fromARGB(255, 77, 69, 69),
    );
  }
}