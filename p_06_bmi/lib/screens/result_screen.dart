import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:p_06_bmi/constants.dart';
import 'package:p_06_bmi/widgets/base/base_screen.dart';
import 'package:p_06_bmi/widgets/result_container.dart';

class ResultScreen extends StatefulWidget {
  final String status;
  final String bmi;
  final String tip;
  final Color statusColor;

  ResultScreen({
    required this.statusColor,
    required this.status,
    required this.bmi,
    required this.tip,
  });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Result',
              style: kNumberStyle.copyWith(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ResultContainer(
              statusColor: widget.statusColor,
              bmi: widget.bmi,
              status: widget.status,
              tip: widget.tip,
              onSavePressed: () {
                onSavePressed();
              },
            ),
          ],
        ),
      ),
      onButtonPressed: () {
        Navigator.pop(context);
      },
    );
  }

  void onSavePressed(){
    // TODO: onSavePressed
  }

}
