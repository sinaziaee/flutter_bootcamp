import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int num1 = 1;
  int num2 = 1;
  int num3 = 1;
  Random random = Random();
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chance Machine'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            (flag == true) ? 'Winner: $num1' : 'Loser',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: (){
                  changeEachPic(1);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                  ),
                  height: 120,
                  width: 120,
                  child: Image(
                    image: AssetImage('assets/fruits/pic-$num1.png'),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: (){
                  changeEachPic(2);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                  ),
                  height: 120,
                  width: 120,
                  child: Image(
                    image: AssetImage('assets/fruits/pic-$num2.png'),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: (){
                  changeEachPic(3);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                  ),
                  height: 120,
                  width: 120,
                  child: Image(
                    image: AssetImage('assets/fruits/pic-$num3.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              changePic();
            },
            child: Text('Press Me'),
          ),
        ],
      ),
    );
  }

  void changePic(){
    setState(() {
      num1 = random.nextInt(5) + 1;
      num2 = random.nextInt(5) + 1;
      num3 = random.nextInt(5) + 1;
      if(num1 == num2 && num2 == num3){
        flag = true;
      }
      else{
        flag = false;
      }
    });
  }

  void changeEachPic(int which){
    setState(() {
      if(which == 1){
        num1 = random.nextInt(5) + 1;
      }
      else if(which == 2){
        num2 = random.nextInt(5) + 1;
      }
      else {
        num3 = random.nextInt(5) + 1;
      }
    });
  }

}
