import 'package:flutter/material.dart';
import 'package:p_06_bmi/screens/result_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p_06_bmi/widgets/base/base_screen.dart';
import 'package:p_06_bmi/widgets/custom_button.dart';
import 'package:p_06_bmi/widgets/gender_container.dart';
import 'package:p_06_bmi/widgets/height_container.dart';
import 'package:p_06_bmi/widgets/selector_container.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMaleActive = true;

  int age = 19, weight = 74;

  double height = 180;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      buttonText: 'CALCULATE YOUR BMI',
      onButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              List result = bmiCalculator();
              return ResultScreen(
                bmi: result[0].toString(),
                status: result[1],
                statusColor: result[2],
                tip: result[3],
              );
            },
          ),
        );
      },
      childWidget: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 1,
            ),
            Row(
              children: [
                GenderContainer(
                  text: 'Male',
                  iconData: FontAwesomeIcons.mars,
                  isActive: isMaleActive,
                  onTapped: () {
                    setState(() {
                      isMaleActive = true;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GenderContainer(
                  text: 'Female',
                  iconData: FontAwesomeIcons.venus,
                  isActive: !isMaleActive,
                  onTapped: () {
                    isMaleActive = false;
                    setState(() {});
                  },
                ),
              ],
            ),
            Row(
              children: [
                HeightContainer(
                  height,
                  (double value) {
                    setState(() {
                      height = value.round() * 1.0;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                SelectorContainer(
                  title: 'WEIGHT',
                  number: weight.toString(),
                  increase: () {
                    changeNumbers(isAgeChanging: false, isIncreasing: true);
                  },
                  decrease: () {
                    changeNumbers(isAgeChanging: false, isIncreasing: false);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                SelectorContainer(
                  title: 'AGE',
                  number: age.toString(),
                  increase: () {
                    changeNumbers(isAgeChanging: true, isIncreasing: true);
                  },
                  decrease: () {
                    changeNumbers(isAgeChanging: true, isIncreasing: false);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void changeNumbers({
    required bool isAgeChanging,
    required bool isIncreasing,
  }) {
    if (isAgeChanging) {
      setState(() {
        if (isIncreasing) {
          if (age < 120) {
            age++;
          } else {
            // pass
          }
        } else {
          if (age > 1) {
            age--;
          } else {
            // pass
          }
        }
        // isIncreasing ? age++ : age--;
      });
    } //
    else {
      setState(() {
        if (isIncreasing) {
          if (weight < 500) {
            weight++;
          } else {
            // pass
          }
        } else {
          if (weight > 5) {
            weight--;
          } else {
            // pass
          }
        }
        // isIncreasing ? weight++ : weight--;
      });
    }
  }

  List bmiCalculator(){
    double bmi = 0;
    String tip;
    Color statusColor;
    String status;
    bmi = weight / pow((height/100), 2);
    if(bmi >= 18.5 && bmi <= 25){
      status = 'Normal';
      statusColor = Colors.greenAccent;
      tip = 'You have a Normal body weight. Good job!';
    }
    else if(bmi < 18.5){
      status = 'Under Weight';
      tip = 'You have a low body weight. Try to eat more!';
      statusColor = Colors.red;
    }
    else{
      status = 'Over Weight';
      tip = 'You have a high body weight. Try to eat less!';
      statusColor = Colors.red;
    }

    return [bmi, status, statusColor, tip];

  }

}
