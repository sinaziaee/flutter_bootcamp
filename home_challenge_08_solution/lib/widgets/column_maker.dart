import 'package:flutter/material.dart';
import 'package:home_challenge_08_solution/widgets/body_container.dart';

class ColumnMaker extends StatelessWidget {
  final List list;
  final Function(String item) onDeletePressed;

  ColumnMaker({required this.list, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: Text(
          'No Items found',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      );
    } //
    else {
      List<Widget> widgetsList = [];
      for (int i = 0; i < list.length; i++) {
        widgetsList.add(
          BodyContainer(
            text: list[i],
            onDeletePressed: onDeletePressed(list[i]),
          ),
        );
      }
      return Column(
        children: widgetsList,
      );
    }
  }
}
