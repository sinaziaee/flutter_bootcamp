import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:p_07/models/todo.dart';
import 'package:p_07/screens/todo_screen.dart';
import 'package:p_07/widgets/custom_circular_progress.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigator('add', Todo(text: '', priority: -1), -1);
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return listViewBuilder();
          } else {
            return CustomProgress();
          }
        },
      ),
    );
  }

  Future<Box> loadData() {
    // todo: complete this later
    return Hive.openBox('todo');
  }

  Widget listViewBuilder() {
    final Box todoBox = Hive.box('todo');
    return ValueListenableBuilder(
      valueListenable: todoBox.listenable(),
      builder: (BuildContext context, Box box, _) {
        if (box.values.isEmpty) {
          return Center(
            child: Text('No Todo available'),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final Todo todo = box.getAt(index);
              return Card(
                child: ListTile(
                  onTap: () {
                    navigator('update', todo, index);
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      remove(index);
                    },
                  ),
                  title: Text(todo.text),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.greenAccent,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Text(
                        todo.priority.toString(),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: todoBox.length,
          );
        }
      },
    );
  }

  remove(int index) {
    Box box = Hive.box('todo');
    box.deleteAt(index);
  }

  void navigator(String type, Todo todo, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TodoScreen(
            type: type,
            todo: todo,
            index: index,
          );
        },
      ),
    );
  }
}
