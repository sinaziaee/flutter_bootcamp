import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:p_07/models/todo.dart';

class TodoScreen extends StatelessWidget {
  final String type;
  final TextEditingController textEditingController = TextEditingController();
  Todo todo;
  final int index;

  TodoScreen({
    required this.type,
    required this.todo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    if (type == 'update') {
      textEditingController.text = todo.text;
    }
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

  onButtonPressed() {
    String value = textEditingController.text;
    if(type == 'add'){
      add(text: value, priority: 5);
    }
    else {
      update(text: value, priority: 2);
    }
  }

  add({required String text, required int priority}) async {
    var box = await Hive.openBox('todo');
    Todo todo = Todo(priority: priority, text: text);
    int result = await box.add(todo);
    print(result);
  }

  update({required String text, required int priority}) async {
    var box = await Hive.openBox('todo');
    Todo todo = Todo(priority: priority, text: text);
    await box.putAt(index, todo);
  }
}
