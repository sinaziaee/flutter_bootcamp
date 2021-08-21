import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:p_06_bmi/constants.dart';
import 'package:p_06_bmi/widgets/base_screen.dart';

class ResultScreen extends StatefulWidget {

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      buttonText: 'RE-CALCULATE YOUR BMI',
      childWidget: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Result',
                  style: kNumberStyle.copyWith(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onButtonPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
