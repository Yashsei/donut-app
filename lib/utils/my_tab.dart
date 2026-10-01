import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  //2.1.1 Declarar variables para el Tab
  final String iconPath;
  final String iconName;
  const MyTab({super.key, required this.iconPath, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Tab();
  }
}
