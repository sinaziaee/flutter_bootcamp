import 'package:flutter/material.dart';
import 'package:p_06_bmi/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: kPinkColor,
      height: 60,
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: kNumberStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
