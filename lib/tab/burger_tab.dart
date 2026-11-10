import 'package:donut_app/services/products_services.dart';
import 'package:donut_app/utils/burger_tile.dart';
import 'package:donut_app/utils/colors.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  const BurgerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getProducts('burger'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final products = snapshot.data!;

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
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return BurgerTile(
                  burgerFlavor: p['flavor'] ?? 'Sin nombre',
                  burgerPrice: p['price'].toString(),
                  burgerColor: hexToColor(p['color']),
                  burgerImagePath: p['image_urls'][0],
                  burgerProvider: p['provider'] ?? 'Desconocido',
                );
              },
            );
          },
        );
      },
    );
  }
}
