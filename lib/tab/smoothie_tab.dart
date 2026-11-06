import 'package:donut_app/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  SmoothieTab({super.key});

  final List smoothieOnSale = [
    [
      'Mango Explosion',
      '85',
      Colors.brown,
      "assets/images/mango.png",
      'Starbucks',
    ],
    ['Coco Power', '89', Colors.red, "assets/images/coco.png", 'Krispy Kreme'],
    [
      'Xtreme Chocolate',
      '95',
      Colors.blue,
      "assets/images/choco.png",
      "Dunkin' Donuts",
    ],
    [
      'Jungle Fresh',
      '70',
      Colors.purple,
      "assets/images/JungleFresh.png",
      'Italian Coffe',
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
          itemCount: smoothieOnSale.length,
          itemBuilder: (context, index) {
            return SmoothieTile(
              smoothieFlavor: smoothieOnSale[index][0],
              smoothiePrice: smoothieOnSale[index][1],
              smoothieColor: smoothieOnSale[index][2],
              smoothieImagePath: smoothieOnSale[index][3],
              smoothieProvider: smoothieOnSale[index][4],
            );
          },
        );
      },
    );
  }
}
