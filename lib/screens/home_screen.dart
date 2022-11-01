import 'package:bmicalculator/components/app_colors.dart';
import 'package:bmicalculator/widgets/bottom_button.dart';
import 'package:bmicalculator/components/calculate_bmi.dart';
import 'package:bmicalculator/widgets/custom_rounded_icon.dart';
import 'package:bmicalculator/components/reuseable_widget.dart';
import 'package:bmicalculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var maleCardColor = AppColors.inactiveCardColor;
  var femaleCardColor = AppColors.inactiveCardColor;

  // genderimages
  String selectedGender = "male";

  void updateColor(int genderNum) {
    if (genderNum == 1) {
      if (maleCardColor == AppColors.inactiveCardColor) {
        maleCardColor = AppColors.activeCardColor;
        femaleCardColor = AppColors.inactiveCardColor;
        selectedGender = "male";
      }
    } else {
      if (femaleCardColor == AppColors.inactiveCardColor) {
        femaleCardColor = AppColors.activeCardColor;
        maleCardColor = AppColors.inactiveCardColor;
        selectedGender = "female";
      }
    }
  }

  double height = 180.0;
  int intHeight = 180;
  int weight = 100;
  int age = 18;
  double heightInFeet = 5.9;
  double heightInInches = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "BMI Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Card(
                          color: AppColors.inactiveCardColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "HEIGHT",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "$intHeight",
                                            style: const TextStyle(
                                              fontFamily: "English",
                                              fontSize: 30,
                                            ),
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const TextSpan(
                                                text: " cm",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "(${heightInFeet.toInt()}' ${heightInInches.toInt()}\")",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: Image.asset(
                                  "assets/images/height.png",
                                ),
                              ),
                              SfSlider.vertical(
                                activeColor: Colors.pink,
                                inactiveColor: Colors.white,
                                min: 120.0,
                                max: 220.0,
                                value: height,
                                interval: 20,
                                showTicks: true,
                                showLabels: true,
                                // enableTooltip: true,
                                minorTicksPerInterval: 1,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    height = value;
                                    intHeight = value.toInt();
                                    heightInFeet = value / 30.48;
                                    heightInInches = (heightInFeet * 12) % 12;
                                  });
                                },
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: ReuseableWidget.bottomCard(
                              "WEIGHT(lb)",
                              weight.toString(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundedIcon(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 1) {
                                          weight--;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CustomRoundedIcon(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ReuseableWidget.bottomCard(
                              "AGE",
                              age.toString(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRoundedIcon(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        if (age > 1) {
                                          age--;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CustomRoundedIcon(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(
                btnName: "Calculate BMI",
                onTap: () {
                  CalculateBMI cal =
                      CalculateBMI(weight: weight, height: intHeight);
                  String bmi = cal.getBMI();
                  String resultText = cal.getResult();
                  String resultMsg = cal.getMsg();
                  double intBMI = cal.getIntBMI();
                  Color bmiResultColor;

                  if (intBMI >= 25) {
                    bmiResultColor = Colors.red;
                  } else if (intBMI > 18.5 && intBMI < 25) {
                    bmiResultColor = const Color(0xFF54e041);
                  } else {
                    bmiResultColor = Colors.yellow;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        bmi: bmi,
                        resultText: resultText,
                        resultMsg: resultMsg,
                        color: bmiResultColor,
                        gender: selectedGender,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
