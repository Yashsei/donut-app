import 'package:donut_app/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  BurgerTab({super.key});

  final List donutOnSale = [
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
    return GridView.builder(
      //GirdDelegate, se encarga de Acomodar/distribuir elementos dentro del GRID
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Tamaño de cada columna relacion 1:1.5 , 1 vale la mitad de 1 y medio
        childAspectRatio: 1 / 1.65,
        //Cantidad de Columnas
        crossAxisCount: 2,
      ),
      //Cantidad de productos
      itemCount: donutOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: donutOnSale[index][0],
          burgerPrice: donutOnSale[index][1],
          burgerColor: donutOnSale[index][2],
          burgerImagePath: donutOnSale[index][3],
          burgerProvider: donutOnSale[index][4],
        );
      },
    );
  }
}
