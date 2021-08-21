import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p_06_bmi/widgets/base_container.dart';
import 'package:p_06_bmi/widgets/circle_button.dart';

import '../constants.dart';

class SelectorContainer extends StatelessWidget {
  final String title;
  final String number;
  final VoidCallback increase;
  final VoidCallback decrease;

  SelectorContainer({
    required this.title,
    required this.number,
    required this.increase,
    required this.decrease,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      childWidget: Column(
        children: [
          Text(
            title,
            style: kTextVariableStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            number,
            style: kNumberStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleButton(
                iconData: FontAwesomeIcons.minus,
                onPressed: decrease,
              ),
              SizedBox(
                width: 10,
              ),
              CircleButton(
                iconData: FontAwesomeIcons.plus,
                onPressed: increase,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
