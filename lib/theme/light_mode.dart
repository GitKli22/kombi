import 'package:flutter/material.dart';

extension CustomColors on ColorScheme {
  Color get successColor => Colors.green;
}
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade800,
  ),
);
final successColor = lightMode.colorScheme.successColor;