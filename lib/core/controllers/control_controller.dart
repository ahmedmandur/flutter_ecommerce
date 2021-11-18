import 'package:ecommerce/screens/checkout/cart_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlController extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeScreen();

  int get navigatorValue => _navigatorValue;
  Widget get currentScreen => _currentScreen;

  void setNavigatorValue(value) {
    _navigatorValue = value;

    switch (value) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = CartScreen();
        break;
      case 2:
        _currentScreen = ProfileScreen();
        break;
    }

    update();
  }
}
