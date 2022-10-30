import 'package:bmicalculator/components/app_colors.dart';
import 'package:bmicalculator/components/reuseable_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var maleCardColor = AppColors.inactiveCardColor;
  var femaleCardColor = AppColors.inactiveCardColor;

  void updateColor(int genderNum) {
    if (genderNum == 1) {
      if (maleCardColor == AppColors.inactiveCardColor) {
        maleCardColor = AppColors.activeCardColor;
        femaleCardColor = AppColors.inactiveCardColor;
      }
    } else {
      if (femaleCardColor == AppColors.inactiveCardColor) {
        femaleCardColor = AppColors.activeCardColor;
        maleCardColor = AppColors.inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: AppColors.secondary,
          title: const Center(
              child: Text(
            "BMI Calculator",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              updateColor(1);
                            });
                          },
                          child: ReuseableWidget.genderCard(
                              "male", "MALE", maleCardColor)),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReuseableWidget.genderCard(
                          "female", "FEMALE", femaleCardColor),
                    )),
                  ],
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Text("Hello"),
                  )),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      bottomCard("WEIGHT", 11),
                      bottomCard("AGE", 18),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Text("Btn"),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomCard(String titleText, int valueNo) {
    return Card(
      child: Column(
        children: [
          Text(titleText),
          Text("$valueNo"),
          Row(
            children: [
              FloatingActionButton(onPressed: () {}),
              FloatingActionButton(onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
