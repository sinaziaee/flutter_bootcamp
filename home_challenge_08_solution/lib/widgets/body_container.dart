import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {

  final Function(String item) onDeletePressed;
  final String text;

  BodyContainer({required this.text, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: onDeletePressed(text),
              iconSize: 60,
              icon: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
            Spacer(),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
