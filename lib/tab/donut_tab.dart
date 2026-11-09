import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  DonutTab({super.key});

  final List donutOnSale = [
    //donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Chocolate',
      '100',
      Colors.brown,
      "assets/images/chocolate_donut.png",
      'Starbucks',
    ],
    [
      'Strawberry',
      '89',
      Colors.red,
      "assets/images/strawberry_donut.png",
      'Krispy Kreme',
    ],
    [
      'Ice Cream',
      '95',
      Colors.blue,
      "assets/images/icecream_donut.png",
      "Dunkin' Donuts",
    ],
    ['Grape', '70', Colors.purple, "assets/images/grape_donut.png", 'Oxxo'],
    [
      'Glass Donut',
      '110',
      Colors.grey,
      'assets/images/glassdonut.png',
      'Krispy Cream',
    ],
    [
      'Green power',
      '80',
      Colors.green,
      'assets/images/donutpepino.png',
      'Oxxo',
    ],
    [
      'Fresh Donut',
      '85',
      Colors.lightBlue,
      'assets/images/freshdonut.png',
      'Dunkin Donuts',
    ],
    [
      'Classic',
      '65',
      Colors.yellow,
      'assets/images/classicdonut.png',
      'Starbucks',
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
          itemCount: donutOnSale.length,
          itemBuilder: (context, index) {
            return DonutTile(
              donutFlavor: donutOnSale[index][0],
              donutPrice: donutOnSale[index][1],
              donutColor: donutOnSale[index][2],
              donutImagePath: donutOnSale[index][3],
              donutProvider: donutOnSale[index][4],
            );
          },
        );
      },
    );
  }
}
