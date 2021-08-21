import 'package:flutter/material.dart';
import 'package:p_06_bmi/constants.dart';
import 'package:p_06_bmi/widgets/base/base_container.dart';

class ResultContainer extends StatelessWidget {
  final String status;
  final String bmi;
  final String tip;
  final Color statusColor;
  final VoidCallback onSavePressed;

  ResultContainer({
    required this.statusColor,
    required this.status,
    required this.bmi,
    required this.tip,
    required this.onSavePressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      childWidget: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              status,
              style: kTextVariableStyle.copyWith(
                color: statusColor,
              ),
            ),
            Text(
              bmi.substring(0, bmi.indexOf(('.')) + 2),
              style: kNumberStyle.copyWith(
                fontSize: 100,
              ),
            ),
            Column(
              children: [
                Text(
                  'Normal BMI range:',
                  style: kTextVariableStyle.copyWith(
                    color: kGreyColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '18,5 - 25 kg/m2',
                  style: kTextVariableStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              tip,
              style: kTextVariableStyle.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              padding: EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 20,
              ),
              onPressed: onSavePressed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: kActiveCardColor,
              child: Text(
                'Save Result',
                style: kTextVariableStyle.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
