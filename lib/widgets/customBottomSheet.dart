// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'itemsWidget.dart';

// // class CustomBottomSheet extends StatefulWidget {
// //   final VoidCallback onPressed;

// //   const CustomBottomSheet({Key? key, required this.onPressed}) : super(key: key);

// //   @override
// //   _CustomBottomSheetState createState() => _CustomBottomSheetState();
// // }
// class CustomBottomSheet extends StatefulWidget {
//   final String itemName;
//   final String itemPrice;
//   final VoidCallback onPressed;

//   const CustomBottomSheet({
//     Key? key,
//     required this.itemName,
//     required this.itemPrice,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   _CustomBottomSheetState createState() => _CustomBottomSheetState();
// }

// final List<String> options = [
//   "Normal Sugar",
//   "Less Sugar",
//   "More Sugar",
//   "No Sugar",
// ];

// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   int quantityCount = 1;

//   // decrement quatity
//   void decrementQuantity() {
//     setState(() {
//       if (quantityCount > 1) {
//         quantityCount--;
//       }
//     });
//   }

//   // increment Quatity
//   void incrementQuantity() {
//     setState(() {
//       quantityCount++;
//     });
//   }

//   String currentOption = options[0];

//   void addToCart() {
//     // if(quantityCount > 0)
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.black54.withOpacity(0.6),
//         insetPadding: EdgeInsets.only(top: 20),
//         title: Text(
//           "Sucessfully added to cart",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 // pop to show bottom page
//                 Navigator.pop(context);
//                 // pop to menu page
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 "OK",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }

//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       height: 500,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 25,
//           ),

//           /// coffee name in sheet bar
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 itemNames[2],
//                 style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.close)),
//             ],
//           ),

//           SizedBox(
//             height: 30,
//           ),

//           /// sugar level selection
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Sugar Level",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Optional (+\$0.00)",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: const Color.fromARGB(255, 114, 112, 112),
//                     ),
//                   )
//                 ],
//               ),
//               // for(int j = 0; j < options.length; j ++)
//               ListTile(
//                 title: Text(
//                   // 'Normal Sugar',
//                   options[0],
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                 ),
//                 leading: Radio<String>(
//                     value: options[0],
//                     groupValue: currentOption,
//                     // activeColor: Colors.blue,
//                     onChanged: (value) {
//                       setState(() {
//                         currentOption = value.toString();
//                       });
//                     }),
//               ),
//               ListTile(
//                 title: Text(
//                   'Less Sweet',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                 ),
//                 leading: Radio<String>(
//                     value: options[1],
//                     groupValue: currentOption,
//                     // activeColor: Colors.blue,
//                     onChanged: (value) {
//                       setState(() {
//                         currentOption = value.toString();
//                       });
//                     }),
//               ),
//               ListTile(
//                 title: Text(
//                   'More Sweet',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                 ),
//                 // Set Radio<String> using _color, set value to 'Red', and set activeColor to red
//                 leading: Radio<String>(
//                     value: options[2],
//                     groupValue: currentOption,
//                     // activeColor: Colors.blue,
//                     onChanged: (value) {
//                       setState(() {
//                         currentOption = value.toString();
//                       });
//                     }),
//               ),
//               ListTile(
//                 title: Text(
//                   'No Sweet',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                 ),
//                 // Set Radio<String> using _color, set value to 'Red', and set activeColor to red
//                 leading: Radio<String>(
//                     value: options[3],
//                     groupValue: currentOption,
//                     // activeColor: Colors.blue,
//                     onChanged: (value) {
//                       setState(() {
//                         currentOption = value.toString();
//                       });
//                     }),
//               ),
//             ],
//           ),

//           SizedBox(
//             height: 20,
//           ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               //// show price in bottom sheet
//               Text(
//                 price[1],
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               SizedBox(
//                 child: Row(
//                   children: [
//                     /// remove icon butoon
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           decrementQuantity();
//                         });
//                       },
//                       icon: Icon(
//                         Icons.remove_circle,
//                         size: 30,
//                       ),
//                     ),

//                     SizedBox(
//                       width: 40,
//                       child: Center(
//                         child: Text(
//                           quantityCount.toString(),
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                     ),

//                     // add icon button
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           incrementQuantity();
//                         });
//                       },
//                       icon: Icon(
//                         Icons.add_circle,
//                         size: 30,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: addToCart,
//               style: ElevatedButton.styleFrom(
//                 // primary: Colors.green,
//                 padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
//                 backgroundColor: Colors.green,
//               ),
//               child: Text(
//                 "Add to Cart",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


  // // Future<PersistentBottomSheetController> customShowBottomSheet(
  // //     BuildContext context, int i) async => showBottomSheet(
  // //       context: context,
  // //       builder: (BuildContext context) {
  // //         return 
  // //       });

