import 'package:donut_app/tab/burger_tab.dart';
import 'package:donut_app/tab/donut_tab.dart';
import 'package:donut_app/tab/pancake_tab.dart';
import 'package:donut_app/tab/pizza_tab.dart';
import 'package:donut_app/tab/smoothie_tab.dart';
import 'package:donut_app/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

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
    //Smoothies Tab
    const MyTab(iconPath: 'assets/icons/smoothie.png', iconName: 'Smoothies'),
    //PanCakes Tab
    const MyTab(iconPath: 'assets/icons/pancakes.png', iconName: 'Pancakes'),
    //Pizza Tab
    const MyTab(iconPath: 'assets/icons/pizza.png', iconName: 'Pizzas'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //Icono de la izquierda
          leading: Icon(Icons.menu),
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
          ],
        ),
      ),
    );
  }
}
