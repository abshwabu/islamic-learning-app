import 'package:flutter/material.dart';

Color? parseHexColor(String? hex) {
  if (hex == null || hex.isEmpty) return null;
  final value = hex.replaceFirst('#', '');
  if (value.length == 6) {
    return Color(int.parse('FF$value', radix: 16));
  }
  if (value.length == 8) {
    return Color(int.parse(value, radix: 16));
  }
  return null;
}

IconData topicIconData(String? iconName) {
  return switch (iconName) {
    'book' => Icons.menu_book_outlined,
    'mosque' => Icons.mosque_outlined,
    'star' => Icons.star_outline,
    'favorite' => Icons.favorite_border,
    'school' => Icons.school_outlined,
    _ => Icons.category_outlined,
  };
}

String dersCountLabel(int count) {
  return count == 1 ? '1 ders' : '$count derses';
}
