import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLight = true;

  void toggle() {
    isLight = !isLight;
    notifyListeners();
  }
}
