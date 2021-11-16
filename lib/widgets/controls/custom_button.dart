import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/widgets/controls/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function()? onPressed;
  bool isSocial;
  Image? image;

  CustomButton(
      {required this.text,
      required this.onPressed,
      this.isSocial = false,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: !isSocial
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: onPressed,
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 1.0,
                ),
              ),
              child: TextButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: image,
                    ),
                    SizedBox(
                      width: 80.0,
                    ),
                    CustomText(
                      text: text,
                      size: 14.0,
                      color: Colors.black,
                      alignment: Alignment.center,
                    )
                  ],
                ),
                onPressed: onPressed,
              ),
            ),
    );
  }
}
