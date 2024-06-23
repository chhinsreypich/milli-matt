import 'package:flutter/material.dart';
import 'package:western/components/indicatorDot.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  double defaultPadding = 12.0;
  int _currentPage = 0;

  final List<String> categories = [
    'lib/images/drinkItems/dt4.png',
    'lib/images/drinkItems/dt1.png',
    'lib/images/drinkItems/dt2.png',
    'lib/images/drinkItems/dt3.png',
    'lib/images/drinkItems/1a.png',
    'lib/images/drinkItems/2a.png',
    'lib/images/drinkItems/3a.png',
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            itemCount: categories.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(categories[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
              children: List.generate(
                categories.length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: defaultPadding / 4),
                  child: IndicatorDot(isActive: index == _currentPage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}