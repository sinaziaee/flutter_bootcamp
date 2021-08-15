import 'package:flutter/material.dart';
import 'package:p_05_quizno/constants.dart';

import '../main.dart';

class ResultScreen extends StatelessWidget {
  List<int> resultList;

  ResultScreen(this.resultList);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDarkBlueColor,
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
                    child: Material(
                      color: kDarkBlueColor,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {
                          onPlayAgainPressed(context);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 170,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Play Again',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
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
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return MyApp();
    // }));
  }
}
