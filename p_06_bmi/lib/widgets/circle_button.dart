import 'package:flutter/material.dart';
import 'package:p_06_bmi/constants.dart';

class CircleButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  CircleButton({
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      minWidth: 60,
      onPressed: onPressed,
      shape: CircleBorder(),
      color: kActiveCardColor,
      child: Center(
        child: Icon(
          iconData,
          size: 30,
        ),
      ),
    );
  }
}
