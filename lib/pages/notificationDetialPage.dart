// import 'package:flutter/material.dart';

// class NotiDetailPage extends StatelessWidget {
//   final String orderName;

//   NotiDetailPage({Key? key, required this.orderName}) : super(key: key);

//   //details
//   final List<Detail> detail = [
//     Detail(
//         personName: 'Oliva',
//         item: 'Iced Americano, Coca-Cola',
//         time: '12:50',
//         price: '1.00'),
//     Detail(personName: 'Jack', item: 'Olatte', time: '9:20', price: '3.00'),
//     Detail(personName: 'Rose', item: 'Sprite', time: '2:00', price: '0.50'),
//   ];

//   @override
//   Widget build(BuildContext context) {

//     Detail selectedDetail =
//         detail.firstWhere((element) => element.personName == orderName);

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Notification Details"),
//         backgroundColor: Colors.grey.shade300,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             maxHeight: 200,
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade300,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     '${selectedDetail.personName}, your order is:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Item: ${selectedDetail.item}',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Time: ${selectedDetail.time}',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Price: \$${selectedDetail.price}',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Detail {
//   final String personName;
//   final String item;
//   final String time;
//   final String price;

//   Detail({
//     required this.personName,
//     required this.item,
//     required this.time,
//     required this.price,
//   });
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NotiDetailPage extends StatelessWidget {
  final String orderName;

  NotiDetailPage({Key? key, required this.orderName}) : super(key: key);

  //details
  final List<Detail> detail = [
    Detail(
        personName: 'MK',
        item: 'Iced Americano, Coca-Cola',
        time: '12:50',
        price: '1.00'),
    Detail(personName: 'Olivia', item: 'Olatte', time: '9:20', price: '3.00'),
    Detail(
      personName: 'Jennie',
      item: 'Sprite',
      time: '2:00',
      price: '0.50',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Detail selectedDetail =
        detail.firstWhere((element) => element.personName == orderName);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notification Details"),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 200,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${selectedDetail.personName}, your order is:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Item: ${selectedDetail.item}',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Time: ${selectedDetail.time}',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Price: \$${selectedDetail.price}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Detail {
  final String personName;
  final String item;
  final String time;
  final String price;

  Detail({
    required this.personName,
    required this.item,
    required this.time,
    required this.price,
  });
}
