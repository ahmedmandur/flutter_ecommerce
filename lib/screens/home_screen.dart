import 'package:ecommerce/core/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends GetWidget<AuthController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: TextButton(
          onPressed: () {
            controller.signOut();
          },
          child: Text('Log out'),
        ),
      )),
    );
  }
}
