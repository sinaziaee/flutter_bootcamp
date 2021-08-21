import 'package:flutter/material.dart';

import '../../constants.dart';

class BaseContainer extends StatelessWidget {

  final Widget childWidget;

  BaseContainer({required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: kInActiveCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: childWidget,
        ),
      ),
    );
  }
}
