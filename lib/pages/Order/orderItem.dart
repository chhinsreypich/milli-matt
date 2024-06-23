// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderItems extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onDelete;

  OrderItems({
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
    widget.onQuantityChanged(_quantity);
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) _quantity--;
    });
    widget.onQuantityChanged(_quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 103, 186, 230),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Slidable(
        key: ValueKey(widget.name),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => widget.onDelete(),
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Card(
          color: Color.fromARGB(173, 238, 231, 231),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 110,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 56, 168, 205).withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "lib/images/drinks/${widget.image}.png",
                    width: 110,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 53, 51, 51),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.price,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 58, 52, 52),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding : EdgeInsets.only(left : 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildIconButton(
                                icon: Icons.remove_circle_outline,
                                onPressed: _decrementQuantity,
                                color: Color.fromARGB(255, 220, 87, 77),
                              ),
                              Container(
                                width: 35,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 70, 165, 194),
                                  border: Border.all(
                                    color:
                                        Color.fromARGB(255, 206, 181, 181),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    '$_quantity',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              _buildIconButton(
                                icon: Icons.add_box_outlined,
                                onPressed: _incrementQuantity,
                                color: Color.fromARGB(255, 41, 118, 44),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
            
          ),
          
        ),
        
      ),
      
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.15),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: color,
        iconSize: 24,
        onPressed: onPressed,
      ),
    );
  }
}