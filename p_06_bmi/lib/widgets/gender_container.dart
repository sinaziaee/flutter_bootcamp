import 'package:flutter/material.dart';

import '../constants.dart';

class GenderContainer extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isActive;
  final VoidCallback onTapped;

  GenderContainer({
    required this.text,
    required this.iconData,
    required this.isActive,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: isActive ? kActiveCardColor : kInActiveCardColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTapped,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 20,
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    iconData,
                    size: 80,
                    color: isActive ? Colors.white : Colors.grey[400],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: isActive ? Colors.white : Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
