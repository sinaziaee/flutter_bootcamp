import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p_05_quizno/constants.dart';
import 'package:p_05_quizno/screens/scores_screen.dart';
import 'package:p_05_quizno/widgets/custom_button.dart';
import 'package:p_05_quizno/widgets/my_alert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatelessWidget {
  List<int> resultList;
  late SharedPreferences pref;
  ResultScreen(this.resultList);
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ++counter;
    if (counter == 1){
      print(counter);
      saveResult();
    }
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.score),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ScoresScreen();
              },
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Center(
              child: CircleAvatar(
                backgroundColor: kLightBlueColor,
                radius: 60,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 55,
                  child: Icon(
                    Icons.person_pin,
                    size: 80,
                    color: (resultList[0] > resultList[1])
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'You are a ${(resultList[0] > resultList[1]) ? 'Winner' : 'Loser'}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  answerContainer('right: ${resultList[0]}', Colors.greenAccent,
                      resultList[0], size),
                  answerContainer('wrong: ${resultList[1]}',
                      Colors.red.shade300, resultList[1], size),
                  answerContainer('white: ${resultList[2]}', Colors.white,
                      resultList[2], size),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Center(
                    child: CustomButton(
                      kDarkBlueColor,
                      'Play Again',
                      () {
                        onPlayAgainPressed(context);
                      },
                      170,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget answerContainer(String text, Color color, int num, Size size) {
    return Container(
      width: size.width * 0.4 + size.width * 0.05 * num,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 5,
          color: kPurpleColor,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void onPlayAgainPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyAlertDialog(
          () {
            onYesPressed(context);
          },
          () {
            onNoPressed(context);
          },
        );
      },
    );

    // Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return MyApp();
    // }));
  }

  void onYesPressed(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void onNoPressed(BuildContext context) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void saveResult() async {
    try {
      pref = await SharedPreferences.getInstance();
      List<String> itemList = pref.getStringList('results') ?? [];
      itemList.add('{right: ${resultList[0]}, wrong: ${resultList[1]}, white: ${resultList[2]}}');
      await pref.setStringList('results', itemList);
      print(pref.getStringList('results') ?? 0);
    } catch (e) {
      print(e);
    }
  }
}
