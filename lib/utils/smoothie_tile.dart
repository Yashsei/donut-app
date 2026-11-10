import 'package:donut_app/utils/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:donut_app/utils/cart_provider.dart';
import 'package:provider/provider.dart';

class SmoothieTile extends StatelessWidget {
  final String smoothieFlavor;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String smoothieImagePath;
  final String smoothieProvider;

  const SmoothieTile({
    super.key,
    required this.smoothieFlavor,
    required this.smoothiePrice,
    this.smoothieColor,
    required this.smoothieImagePath,
    required this.smoothieProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: smoothieColor[100],
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
                    color: smoothieColor[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$smoothiePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: smoothieColor[800],
                    ),
                  ),
                ),
              ],
            ),
            //Imagen de la Dona
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                child: Image.network(smoothieImagePath),
              ),
            ),
            //Nombre de la Dona
            Text(
              smoothieFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //Espacio entre textos
            const SizedBox(height: 4),
            //Nombre del proveedor
            Text(smoothieProvider, style: TextStyle(color: Colors.grey[1600])),
            //Espacio entre textos
            //Iconos de fav y carrito
            Padding(
              padding: const EdgeInsetsGeometry.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      context.watch<FavProvider>().isFavorite(smoothieFlavor)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.pink[400],
                    ),
                    onPressed: () {
                      context.read<FavProvider>().toggleFavorite(
                        name: smoothieFlavor,
                        imagePath: smoothieImagePath,
                        price: double.parse(smoothiePrice),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<CartProvider>().addItem(
                        name: smoothieFlavor,
                        imagePath: smoothieImagePath,
                        price: double.parse(smoothiePrice),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$smoothieFlavor agregado al carrito'),
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
