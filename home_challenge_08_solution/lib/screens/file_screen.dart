import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({Key? key}) : super(key: key);

  @override
  _FileScreenState createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  String text = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(text),
            ElevatedButton(
              onPressed: () async {
                await write('test.txt', 'hello guys');
              },
              child: Text('write'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await read('test.txt');
                print(result);
                setState(() {

                });
              },
              child: Text('read'),
            ),
          ],
        ),
      ),
    );
  }

  Future<File> write(String file_name, String text) async {
    try {
      final File file = await getFile(file_name);
      return file.writeAsString(text);
    } catch (e) {
      return File('');
    }
  }

  Future<String> read(String file_name) async {
    try {
      final File file = await getFile(file_name);
      text = await file.readAsString();
      return text;
    } catch (e) {
      return '-1';
    }
  }

  Future<File> getFile(String file_name) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    // print('directory: $directory');
    // print('path: ${directory.path}');
    // print('parent: ${directory.parent}');
    final path = directory.path;
    final File file = File('$path/$file_name');
    // print('file: ${file.path}');
    // print('file absolute path: ${file.absolute}');
    return file;
  }
}
