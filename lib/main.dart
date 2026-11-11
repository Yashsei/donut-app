import 'package:donut_app/screens/cloudscreen.dart';
import 'package:donut_app/utils/cart_provider.dart';
import 'package:donut_app/utils/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Supabase.initialize(
      url: 'https://jqfavnfihhhuqjqtmvgq.supabase.co',
      publishableKey: 'sb_publishable_6fVEizpS6kAF3hdvikVk8w_QpmBoT1H',
    );
  } catch (e) {
    debugPrint('Error al inicializar Supabase: $e');
  }

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
      title: 'Donut App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CloudScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
