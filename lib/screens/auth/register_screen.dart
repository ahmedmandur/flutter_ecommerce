import 'package:ecommerce/core/controllers/auth_controller.dart';
import 'package:ecommerce/widgets/controls/custom_button.dart';
import 'package:ecommerce/widgets/controls/custom_input.dart';
import 'package:ecommerce/widgets/controls/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterScreen extends GetWidget<AuthController> {
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
              padding:
                  const EdgeInsets.only(top: 25.0, right: 20.0, left: 20.0),
              child: Form(
                key: globalKey,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Sign Up",
                            size: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ]),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      children: [
                        CustomInput(
                          labelText: "Name",
                          hintText: "John Doe",
                          onSaved: (value) {
                            controller.name = value ?? "";
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        CustomInput(
                          labelText: "Email",
                          hintText: "johndoe@email.com",
                          onSaved: (value) {
                            controller.email = value ?? "";
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        CustomInput(
                          labelText: "Password",
                          hintText: "****************",
                          isPassword: true,
                          onSaved: (value) {
                            controller.password = value ?? "";
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        CustomButton(
                          text: "SIGN UP",
                          onPressed: () {
                            globalKey.currentState!.save();
                            if (globalKey.currentState!.validate()) {
                              controller.signUpWithEmailAndPassword();
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
