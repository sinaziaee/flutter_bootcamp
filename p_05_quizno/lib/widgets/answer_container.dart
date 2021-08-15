import 'package:flutter/material.dart';

class AnswerContainer extends StatelessWidget {

  final Color color;
  final String answer;
  final VoidCallback onPressed;

  AnswerContainer(this.color, this.answer, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 4,
            color: Colors.blue.shade800,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '$answer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Icon(
                Icons.brightness_1_rounded,
                color: color,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
