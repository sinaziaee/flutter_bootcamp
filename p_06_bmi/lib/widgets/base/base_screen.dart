import 'package:flutter/material.dart';
import 'package:p_06_bmi/screens/result_screen.dart';

import '../custom_button.dart';

class BaseScreen extends StatelessWidget {
  final Widget childWidget;
  final VoidCallback onButtonPressed;
  final String buttonText;

  BaseScreen({
    required this.childWidget,
    required this.onButtonPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: Icon(
          Icons.clear_all,
          size: 30,
        ),
        title: Text(
          'BMI Calculator',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: childWidget,
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            buttonText,
            onButtonPressed,
          ),
        ],
      ),
    );
  }
}
