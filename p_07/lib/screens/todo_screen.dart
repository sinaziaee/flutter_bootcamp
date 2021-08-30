import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  final String type;
  final TextEditingController textEditingController = TextEditingController();

  TodoScreen({
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Todo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              type.toLowerCase() == 'add' ? Icons.add : Icons.edit,
            ),
            label: Text(type),
          ),
        ],
      ),
    );
  }
}
