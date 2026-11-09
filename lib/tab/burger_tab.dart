import 'package:donut_app/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  BurgerTab({super.key});

  final List burgerOnSale = [
    [
      'Cheese Burger',
      '100',
      Colors.brown,
      "assets/images/cheeseburger.png",
      'Burger King',
    ],
    [
      'Fresh Burger',
      '95',
      Colors.red,
      "assets/images/simpleburger.webp",
      'Carls Junior',
    ],
    [
      'Cangre Burger',
      '110',
      Colors.blue,
      "assets/images/cangreburger.png",
      "Crustaceo Cascarudo",
    ],
    ['Big Mac', '120', Colors.purple, "assets/images/BigMac.png", 'MC Donalds'],
    [
      'Classic',
      '85',
      Colors.green,
      'assets/images/classicburger.png',
      'Burger King',
    ],
    [
      'Beacon Special',
      '100',
      Colors.deepOrangeAccent,
      'assets/images/beacon.png',
      'Burger King',
    ],
    [
      'Jumbo Burger',
      '125',
      Colors.grey,
      'assets/images/jumbo.png',
      'MC Donalds',
    ],
    [
      'Triple Burger',
      '150',
      Colors.red,
      'assets/images/tripleburger.png',
      'Subway',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final crossAxisCount = width >= 900 ? 4 : (width >= 600 ? 3 : 2);

        final tileWidth = width / crossAxisCount;

        final imageSize = tileWidth - 72;

        const fixedContentHeight = 215.0;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: imageSize + fixedContentHeight,
          ),
          itemCount: burgerOnSale.length,
          itemBuilder: (context, index) {
            return BurgerTile(
              burgerFlavor: burgerOnSale[index][0],
              burgerPrice: burgerOnSale[index][1],
              burgerColor: burgerOnSale[index][2],
              burgerImagePath: burgerOnSale[index][3],
              burgerProvider: burgerOnSale[index][4],
            );
          },
        );
      },
    );
  }
}
