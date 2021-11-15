import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/widgets/controls/custom_input.dart';
import 'package:ecommerce/widgets/controls/custom_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomText(
                text: "Welcome,",
                size: 30.0,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "Sign Up",
                color: PRIMARY_COLOR,
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
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomInput(
                  labelText: "Password",
                  hintText: "****************",
                  isPassword: true,
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomText(
                  text: 'Forgot Password?',
                  alignment: Alignment.topRight,
                  size: 14.0,
                ),
              ],
            )
          ],
        ));
  }
}
