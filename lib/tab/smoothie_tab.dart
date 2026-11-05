import 'package:donut_app/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  SmoothieTab({super.key});

  final List smoothieOnSale = [
    //donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
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
    return GridView.builder(
      //GirdDelegate, se encarga de Acomodar/distribuir elementos dentro del GRID
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Tamaño de cada columna relacion 1:1.5 , 1 vale la mitad de 1 y medio
        childAspectRatio: 1 / 1.65,
        //Cantidad de Columnas
        crossAxisCount: 2,
      ),
      //Cantidad de productos
      itemCount: smoothieOnSale.length,
      //Lo que se va a construir
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
  }
}
