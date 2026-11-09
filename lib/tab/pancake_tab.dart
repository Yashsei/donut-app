import 'package:donut_app/utils/pancake_tile.dart';
import 'package:flutter/material.dart';

class PancakeTab extends StatelessWidget {
  PancakeTab({super.key});

  final List pancakeOnSale = [
    [
      'Cherry Pancake',
      '70',
      Colors.brown,
      "assets/images/cherry.png",
      'Donkin Donuts',
    ],
    [
      'Nutella Tower',
      '95',
      Colors.red,
      "assets/images/pancaketower.gif",
      'Krispy Kreme',
    ],
    ['Pancake', '95', Colors.blue, "assets/images/Pancake.png", "Tim Hortons"],
    [
      'Pancake Tower',
      '70',
      Colors.purple,
      "assets/images/pancaketower.png",
      'Oxxo',
    ],
    ['Blue Dream', '89', Colors.indigo, 'assets/images/bluedream.png', 'IHop'],
    [
      'Matcha Magic',
      '93',
      Colors.green,
      'assets/images/matchamagic.png',
      'Starbucks',
    ],
    [
      'Stawberry & Coco',
      '80',
      Colors.pink,
      "assets/images/strawcoco.png",
      'Vips',
    ],
    [
      'Caramel Pecan',
      '110',
      Colors.orange,
      "assets/images/caramel.png",
      'Denny\'s',
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
          itemCount: pancakeOnSale.length,
          itemBuilder: (context, index) {
            return PancakeTile(
              pancakeFlavor: pancakeOnSale[index][0],
              pancakePrice: pancakeOnSale[index][1],
              pancakeColor: pancakeOnSale[index][2],
              pancakeImagePath: pancakeOnSale[index][3],
              pancakeProvider: pancakeOnSale[index][4],
            );
          },
        );
      },
    );
  }
}
