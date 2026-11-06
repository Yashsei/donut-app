import 'package:donut_app/utils/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:donut_app/utils/cart_provider.dart';
import 'package:provider/provider.dart';

class PancakeTile extends StatelessWidget {
  final String pancakeFlavor;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String pancakeImagePath;
  final String pancakeProvider;

  const PancakeTile({
    super.key,
    required this.pancakeFlavor,
    required this.pancakePrice,
    this.pancakeColor,
    required this.pancakeImagePath,
    required this.pancakeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pancakeColor[100],
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          children: [
            //Etiqueta de precio
            Row(
              //Alinear a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 18.0,
                  ),
                  decoration: BoxDecoration(
                    color: pancakeColor[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$pancakePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pancakeColor[800],
                    ),
                  ),
                ),
              ],
            ),
            //Imagen de la Dona
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(pancakeImagePath),
            ),
            //Nombre de la Dona
            Text(
              pancakeFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //Espacio entre textos
            const SizedBox(height: 4),
            //Nombre del proveedor
            Text(pancakeProvider, style: TextStyle(color: Colors.grey[1600])),
            //Espacio entre textos
            //Iconos de fav y carrito
            Padding(
              padding: const EdgeInsetsGeometry.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      context.watch<FavProvider>().isFavorite(pancakeFlavor)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.pink[400],
                    ),
                    onPressed: () {
                      context.read<FavProvider>().toggleFavorite(
                        name: pancakeFlavor,
                        imagePath: pancakeImagePath,
                        price: double.parse(pancakePrice),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<CartProvider>().addItem(
                        name: pancakeFlavor,
                        imagePath: pancakeImagePath,
                        price: double.parse(pancakePrice),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$pancakeFlavor agregado al carrito'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
