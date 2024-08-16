import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class MyCustomeElevatedButton extends StatelessWidget {
  const MyCustomeElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.hieght,
    required this.width,
    this.backgroundColor,
    this.forgroundColor,
  });
  final void Function()? onPressed;
  final String text;
  final double hieght;
  final double width;
  final Color? backgroundColor;
  final Color? forgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width, hieght),
          backgroundColor: backgroundColor ?? kPrimaryColor,
          foregroundColor: forgroundColor ?? Colors.white),
    );
  }
}
