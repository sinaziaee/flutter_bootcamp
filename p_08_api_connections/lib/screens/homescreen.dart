import 'dart:io';

import 'package:flutter/material.dart';
import 'package:p_08_api_connections/constant_methods.dart';
import 'package:p_08_api_connections/models/post.dart';
import 'package:p_08_api_connections/screens/post_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:p_08_api_connections/widgets/post_item.dart';
import 'package:dio/dio.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  final int userId;

  HomeScreen({
    required this.token,
    required this.userId,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          IconButton(
            onPressed: () async {
              bool flag = await kSignOut();
              if (flag == true) {
                kNavigate(-1, context, 'login', '-1');
              }
            },
            icon: Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
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
                uploaderId: -1),
          );
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          return;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: FutureBuilder(
            future: loadData(),
            builder: (context, AsyncSnapshot<http.Response> snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                http.Response response =
                    snapshot.data ?? http.Response('', 420);
                if (response.statusCode >= 300) {
                  return Center(
                    child: Text(
                      response.body.toString(),
                    ),
                  );
                }
                // print(response.statusCode);
                // print(response.body);
                List list = convert.json.decode(response.body);
                if (list.length == 0) {
                  return Center(
                    child: Text('No recent post sent'),
                  );
                }
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Map map = list[index];
                    Post post = Post(
                        title: map['title'],
                        description: map['description'],
                        imageUrl: map['image'],
                        id: map['id'],
                        uploaderId: map['uploader_id']);
                    return PostItem(
                      showDeleteOption: map['uploader_id'] == widget.userId,
                      post: post,
                      onDeletePressed: () {
                        deletePost(map['id']);
                      },
                      onUpdatePressed: () {
                        if(post.uploaderId == widget.userId){
                          navigate('Update', post);
                        }
                      },
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<http.Response> loadData() async {
    // print('requested URL: $kBaseUrl/api/post/all/');
    http.Response response = await http.get(
      Uri.parse('$kBaseUrl/api/post/all/'),
      headers: {
        HttpHeaders.authorizationHeader: widget.token,
      },
    );
    print(response.body);
    return response;
  }

  navigate(String type, Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddPostScreen(
            post: post,
            type: type,
            token: widget.token,
          );
        },
      ),
    );
  }

  deletePost(int postId) async {
    http.Response response = await http.delete(
      Uri.parse(
        '$kBaseUrl/api/post/delete/$postId/',
      ),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        HttpHeaders.authorizationHeader: widget.token,
      },
    );
    if (response.statusCode < 300) {
      setState(() {});
    }
    print(response.statusCode);
    print(response.body);
  }
}
