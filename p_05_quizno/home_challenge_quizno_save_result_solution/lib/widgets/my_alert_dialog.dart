import 'package:flutter/material.dart';

import 'custom_button.dart';

class MyAlertDialog extends StatelessWidget {
  final VoidCallback onYesPressed, onNoPressed;

  MyAlertDialog(this.onYesPressed, this.onNoPressed);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text('Would you like to play again ?'),
      content: Container(
        width: 300,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                Colors.lightGreen,
                'Yes',
                onYesPressed,
                100,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: CustomButton(
                Colors.red,
                'No',
                onNoPressed,
                100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
