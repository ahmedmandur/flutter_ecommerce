import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/widgets/controls/custom_text.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  String hintText;
  String labelText;
  bool isPassword;
  Function(String?)? onSaved;
  String? Function(String?)? validator;

  TextEditingController? controller;

  CustomInput(
      {this.hintText = "",
      required this.labelText,
      this.isPassword = false,
      this.onSaved,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: this.labelText,
          size: 14.0,
        ),
        TextFormField(
            onSaved: onSaved,
            validator: validator,
            style: TextStyle(fontSize: 18.0),
            obscureText: this.isPassword,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: PRIMARY_COLOR),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: PRIMARY_COLOR),
                ),
                hintText: this.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                fillColor: Colors.white)),
      ],
    );
  }
}
