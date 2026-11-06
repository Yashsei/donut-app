import 'package:donut_app/utils/cart_provider.dart';
import 'package:donut_app/utils/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
