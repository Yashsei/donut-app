import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        //1.1 Texto Principal

        //1.2 Pestañas (TabBar)
        //1.3 Contenido de Pestañas (TabBarView)
        //1.4 Carrito (Cart)
      ),
    );
  }
}
