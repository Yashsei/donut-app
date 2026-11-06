import 'package:flutter/foundation.dart';

class FavItem {
  final String name;
  final String imagePath;
  final double price;

  FavItem({required this.name, required this.imagePath, required this.price});
}

class FavProvider extends ChangeNotifier {
  final List<FavItem> _items = [];

  List<FavItem> get items => List.unmodifiable(_items);

  // Para saber si el corazón va lleno o vacío
  bool isFavorite(String name) => _items.any((i) => i.name == name);

  // Si ya es favorito lo quita, si no lo agrega
  void toggleFavorite({
    required String name,
    required String imagePath,
    required double price,
  }) {
    final index = _items.indexWhere((i) => i.name == name);
    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(FavItem(name: name, imagePath: imagePath, price: price));
    }
    notifyListeners();
  }

  void removeItem(FavItem item) {
    _items.remove(item);
    notifyListeners();
  }
}
