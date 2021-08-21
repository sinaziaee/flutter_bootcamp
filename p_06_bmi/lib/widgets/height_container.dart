import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:p_06_bmi/constants.dart';

import 'base/base_container.dart';

class HeightContainer extends StatelessWidget {
  final double height;
  final Function(double value) onChanged;

  HeightContainer(this.height, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      childWidget: Column(
        children: [
          Text(
            'HEIGHT',
            style: kTextVariableStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                height.toString().replaceFirst('.0', ''),
                style: kNumberStyle,
              ),
              Text(
                'cm',
                style: kTextVariableStyle.copyWith(
                  fontSize: 18,
                ),
              )
            ],
          ),
          Slider(
            value: height,
            min: 40,
            max: 240,
            onChanged: onChanged,
            activeColor: kPinkColor,
            inactiveColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
