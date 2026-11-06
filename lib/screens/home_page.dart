import 'package:donut_app/screens/fav.dart';
import 'package:donut_app/tab/burger_tab.dart';
import 'package:donut_app/tab/donut_tab.dart';
import 'package:donut_app/tab/pancake_tab.dart';
import 'package:donut_app/tab/pizza_tab.dart';
import 'package:donut_app/tab/smoothie_tab.dart';
import 'package:donut_app/screens/cart.dart';
import 'package:donut_app/utils/cart_provider.dart';
import 'package:donut_app/utils/fav_provider.dart';
import 'package:donut_app/utils/my_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //2.1
  List<Widget> myTabs = [
    //Donut Tab
    const MyTab(iconPath: 'assets/icons/donut.png', iconName: 'Donuts'),
    //Burger Tab
    const MyTab(iconPath: 'assets/icons/burger.png', iconName: 'Burgers'),
    //Pizza Tab
    const MyTab(iconPath: 'assets/icons/pizza.png', iconName: 'Pizza'),
    //PanCakes Tab
    const MyTab(iconPath: 'assets/icons/pancakes.png', iconName: 'Pancakes'),
    //Smoothies Tab
    const MyTab(iconPath: 'assets/icons/smoothie.png', iconName: 'Smoothie'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //Icono de la izquierda
          leading: IconButton(
            icon: Icon(
              context.watch<FavProvider>().isFavorite('donut')
                  ? Icons.menu
                  : Icons.favorite_border_outlined,
              color: Colors.pink[400],
            ),
            onPressed: () {
              context.read<FavProvider>().toggleFavorite(
                name: 'donutFlavor',
                imagePath: 'donutImagePath',
                price: 15.0,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Fav()),
              );
            },
          ),
          //Icono dela derecha
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey),
            ),
          ],
        ),
        body: Column(
          //1. Texto Principal
          //1.1Texto
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    'I want to ',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  Text(
                    'Eat',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            //2 Pestañas (TabBar)
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: myTabs,
            ),
            //1.3 Contenido de Pestañas (TabBarView)
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  PizzaTab(),
                  PancakeTab(),
                  SmoothieTab(),
                ],
              ),
            ),
            //1.4 Carrito (Cart)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Se actualiza solo cuando cambia el carrito
                        Consumer<CartProvider>(
                          builder: (context, cart, child) => Text(
                            '${cart.totalItems} items | \$${cart.totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          'Delivery charges included',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Cart()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400],
                    ),
                    child: Text(
                      'View Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
