import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final String item;

  BodyContainer({required this.onDeletePressed, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: () {
          print('tapped');
        },
        onLongPress: () {
          print('pressed for long time');
        },
        leading: IconButton(
          onPressed: onDeletePressed,
          icon: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        ),
        trailing: Text(item),
      ),
    );
  }
}
