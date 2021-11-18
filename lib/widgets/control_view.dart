import 'package:ecommerce/core/controllers/auth_controller.dart';
import 'package:ecommerce/core/controllers/control_controller.dart';
import 'package:ecommerce/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

import 'controls/custom_text.dart';

class ControlView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlController>(
              init: ControlController(),
              builder: (context) => Scaffold(
                    body: Get.find<ControlController>().currentScreen,
                    bottomNavigationBar: _buttomNavigationBar(),
                  ));
    });
  }

  _buttomNavigationBar() {
    return GetBuilder<ControlController>(
      init: ControlController(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  CustomText(
                    text: 'Explore',
                    size: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    alignment: Alignment.center,
                  ),
                  CustomText(
                    text: '.',
                    size: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            icon: Image.asset(
              "assets/icons/Icon_Explore.png",
              width: 20.0,
              fit: BoxFit.contain,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  CustomText(
                    text: 'Cart',
                    size: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    alignment: Alignment.center,
                  ),
                  CustomText(
                    text: '.',
                    size: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            icon: Image.asset(
              "assets/icons/Icon_Cart.png",
              width: 20.0,
              fit: BoxFit.contain,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  CustomText(
                    text: 'Account',
                    size: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    alignment: Alignment.center,
                  ),
                  CustomText(
                    text: '.',
                    size: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            icon: Image.asset(
              "assets/icons/Icon_User.png",
              width: 20.0,
              fit: BoxFit.contain,
            ),
            label: "",
          ),
        ],
        currentIndex: controller.navigatorValue,
        elevation: 5.0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
        onTap: (index) {
          controller.setNavigatorValue(index);
        },
      ),
    );
  }
}
