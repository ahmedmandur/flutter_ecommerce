import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/controllers/auth_controller.dart';
import 'package:ecommerce/screens/auth/register_screen.dart';
import 'package:ecommerce/widgets/controls/custom_button.dart';
import 'package:ecommerce/widgets/controls/custom_input.dart';
import 'package:ecommerce/widgets/controls/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends GetWidget<AuthController> {
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
            child: Form(
              key: globalKey,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Welcome,",
                          size: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: "Sign Up",
                          color: PRIMARY_COLOR,
                          onTap: () {
                            print('object');
                            Get.to(RegisterScreen());
                          },
                        ),
                      ]),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomText(
                    text: 'Sign in to continue',
                    color: Colors.grey.shade500,
                    size: 14.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: [
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
                        height: 15.0,
                      ),
                      CustomText(
                        text: 'Forgot Password?',
                        alignment: Alignment.topRight,
                        size: 14.0,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomButton(
                        text: "Sign In",
                        onPressed: () {
                          globalKey.currentState!.save();
                          if (globalKey.currentState!.validate()) {
                            controller.signinwithEmail();
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomText(
                        text: "-OR-",
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomButton(
                          text: "Sign in wth Facebook",
                          onPressed: () {
                            controller.signInWithFacebook();
                          },
                          isSocial: true,
                          image: Image.asset(
                            "assets/icons/facebook_login.png",
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                          text: "Sign in wth Google",
                          onPressed: () {
                            controller.signInWithGoogle();
                          },
                          isSocial: true,
                          image: Image.asset(
                            "assets/icons/google_login.png",
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
