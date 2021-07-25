import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

// hot reload, hot restart, start

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade300,
      appBar: AppBar(
        title: Text(
          'About Me',
          style: TextStyle(
            fontFamily: 'ZenLoop-Italic',
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellow.shade300,
        elevation: 10, // سایه
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              height: 200,
              image: AssetImage('assets/images/licotab1.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.person_pin,
                  size: 30,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Sina Ziaee',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ZenLoop-Regular'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ZenLoop-Regular'
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.red[500],
              child: FadeInImage(
                height: 200,
                image: NetworkImage('https://licotab.ir/home/img/licotab.png'),
                placeholder: AssetImage('assets/images/licotab1.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
