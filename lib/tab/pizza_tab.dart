import 'package:donut_app/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  PizzaTab({super.key});

  final List pizzaOnSale = [
    //donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Pizza',
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
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //GirdDelegate, se encarga de Acomodar/distribuir elementos dentro del GRID
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Tamaño de cada columna relacion 1:1.5 , 1 vale la mitad de 1 y medio
        childAspectRatio: 1 / 1.65,
        //Cantidad de Columnas
        crossAxisCount: 2,
      ),
      //Cantidad de productos
      itemCount: pizzaOnSale.length,
      //Lo que se va a construir
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
  }
}
