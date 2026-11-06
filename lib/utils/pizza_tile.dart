import 'package:donut_app/utils/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:donut_app/utils/cart_provider.dart';
import 'package:provider/provider.dart';

class PizzaTile extends StatelessWidget {
  final String pizzaFlavor;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String pizzaImagePath;
  final String pizzaProvider;

  const PizzaTile({
    super.key,
    required this.pizzaFlavor,
    required this.pizzaPrice,
    this.pizzaColor,
    required this.pizzaImagePath,
    required this.pizzaProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pizzaColor[100],
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
                    color: pizzaColor[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$pizzaPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pizzaColor[800],
                    ),
                  ),
                ),
              ],
            ),
            //Imagen de la Pizza
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(pizzaImagePath),
            ),
            //Nombre de la Dona
            Text(
              pizzaFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //Espacio entre textos
            const SizedBox(height: 4),
            //Nombre del proveedor
            Text(pizzaProvider, style: TextStyle(color: Colors.grey[1600])),
            //Espacio entre textos
            //Iconos de fav y carrito
            Padding(
              padding: const EdgeInsetsGeometry.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      context.watch<FavProvider>().isFavorite(pizzaFlavor)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.pink[400],
                    ),
                    onPressed: () {
                      context.read<FavProvider>().toggleFavorite(
                        name: pizzaFlavor,
                        imagePath: pizzaImagePath,
                        price: double.parse(pizzaPrice),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<CartProvider>().addItem(
                        name: pizzaFlavor,
                        imagePath: pizzaImagePath,
                        price: double.parse(pizzaPrice),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$pizzaFlavor agregado al carrito'),
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
