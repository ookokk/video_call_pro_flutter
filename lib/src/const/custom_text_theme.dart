import 'package:flutter/material.dart';

class CustomTextTheme {
  CustomTextTheme._init();
  static CustomTextTheme? _instance;
  static CustomTextTheme? get instance {
    _instance ??= CustomTextTheme._init();
    return _instance;
  }

  final TextStyle headline38 = const TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
  final TextStyle headline34 = const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );
  final TextStyle headline28 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline26 = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  final TextStyle headline24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
  final TextStyle headline18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
  final TextStyle headline16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
  final TextStyle headline14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
