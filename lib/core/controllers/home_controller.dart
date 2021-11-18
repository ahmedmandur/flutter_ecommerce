import 'package:get/get.dart';

class HomeController extends GetxController {
  int _navigatorValue = 0;

  int get navigatorValue => _navigatorValue;

  void setNavigatorValue(int value) {
    _navigatorValue = value;
    update();
  }
}
