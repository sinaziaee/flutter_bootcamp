import 'package:flutter/material.dart';

import '../constants.dart';

class MyAnimationBar extends StatelessWidget {

  final double value;

  MyAnimationBar(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 4,
          color: Colors.grey,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: kDarkBlueColor,
          valueColor: AlwaysStoppedAnimation(Colors.red),
        ),
      ),
    );
  }
}
