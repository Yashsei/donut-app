import 'package:donut_app/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  BurgerTab({super.key});

  final List burgerOnSale = [
    [
      'Cheese Burger',
      '120',
      Colors.brown,
      "assets/images/cheeseburger.png",
      'Burger King',
    ],
    [
      'Simple Burger',
      '89',
      Colors.red,
      "assets/images/simpleburger.webp",
      'Carls Junior',
    ],
    [
      'Cangre Burger',
      '95',
      Colors.blue,
      "assets/images/cangreburger.png",
      "Crustaceo Cascarudo",
    ],
    ['Big Mac', '70', Colors.purple, "assets/images/BigMac.png", 'MC Donalds'],
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
