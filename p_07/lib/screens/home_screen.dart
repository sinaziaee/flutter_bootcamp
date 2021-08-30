import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TodoScreen(type: 'add');
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
            return Container();
          }
          else {
            return CustomProgress();
          }
        },
      ),
    );
  }

  Future<Box> loadData(){
    // todo: complete this later
    return Hive.openBox('todo');
  }

}
