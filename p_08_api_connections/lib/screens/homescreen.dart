import 'package:flutter/material.dart';
import 'package:p_08_api_connections/models/post.dart';
import 'package:p_08_api_connections/screens/post_screen.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

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
            'Add',
            Post(
              id: -1,
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

  loadData() async {
    http.Response response = await http.get(
      Uri.parse('$kBaseUrl/api/post/all/'),
    );
    print(response.statusCode);
    print(response.body);
  }

  navigate(String type, Post post) {
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
