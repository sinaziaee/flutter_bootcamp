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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                onButtonPressed();
              },
              icon: Icon(
                type.toLowerCase() == 'add' ? Icons.add : Icons.edit,
                color: Colors.black,
              ),
              label: Text(
                type,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onButtonPressed(){
    String value = textEditingController.text;
    print(value);
  }

}
