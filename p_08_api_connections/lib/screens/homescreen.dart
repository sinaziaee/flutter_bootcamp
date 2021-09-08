import 'package:flutter/material.dart';
import 'package:p_08_api_connections/models/post.dart';
import 'package:p_08_api_connections/screens/add_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigate(
            'add',
            Post(
              imageUrl: '',
              description: '',
              title: '',
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            return Container();
          },
        ),
      ),
    );
  }

  loadData() {}

  navigate(String type, Post post) {
    if (type.toLowerCase() == 'add') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AddPostScreen(
              post: Post(
                title: '',
                description: '',
                imageUrl: '',
              ),
              type: type,
            );
          },
        ),
      );
    } //
    else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AddPostScreen(
              post: post,
              type: type,
            );
          },
        ),
      );
    }
  }
}
