import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
      body: Padding(padding: const EdgeInsetsGeometry.all(24)),
    );
  }
}
