import 'package:flutter/material.dart';

Color hexToColor(String? hex) {
  if (hex == null || hex.isEmpty) return Colors.grey;
  final cleaned = hex.replaceFirst('#', '');
  return Color(int.parse('FF$cleaned', radix: 16));
}
