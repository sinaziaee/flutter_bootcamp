import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color color;
  final VoidCallback onTapped;
  final double buttonWidth;

  CustomButton(this.color, this.text, this.onTapped, this.buttonWidth);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTapped,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: this.buttonWidth,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
