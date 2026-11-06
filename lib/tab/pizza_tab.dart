import 'package:donut_app/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  PizzaTab({super.key});
  final List pizzaOnSale = [
    ['Pizza', '100', Colors.brown, "assets/images/pizzapep.png", 'Dominos'],
    [
      'Pizza Hawaiana',
      '89',
      Colors.red,
      "assets/images/hawaiana.webp",
      'Pizza Hut',
    ],
    [
      'Pizza Italiana',
      '95',
      Colors.blue,
      "assets/images/Italiana.webp",
      "Don Queso",
    ],
    ['Champizza', '70', Colors.purple, "assets/images/champ.png", 'Messinas'],
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
          itemCount: pizzaOnSale.length,
          itemBuilder: (context, index) {
            return PizzaTile(
              pizzaFlavor: pizzaOnSale[index][0],
              pizzaPrice: pizzaOnSale[index][1],
              pizzaColor: pizzaOnSale[index][2],
              pizzaImagePath: pizzaOnSale[index][3],
              pizzaProvider: pizzaOnSale[index][4],
            );
          },
        );
      },
    );
  }
}
