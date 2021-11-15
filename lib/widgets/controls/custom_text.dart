import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight fontWeight;
  Alignment alignment;

  CustomText(
      {required this.text,
      this.size = 18.0,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.alignment = Alignment.topLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: this.alignment,
      child: Text(
        this.text,
        style: TextStyle(
            fontSize: this.size,
            fontWeight: this.fontWeight,
            color: this.color),
      ),
    );
  }
}
