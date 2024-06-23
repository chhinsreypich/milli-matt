import 'package:flutter/material.dart';

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: isActive ? Color.fromARGB(255, 9, 110, 225) : Color.fromARGB(137, 0, 0, 0),
      ),
    );
  }
}