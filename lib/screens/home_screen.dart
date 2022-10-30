import 'package:bmicalculator/components/app_colors.dart';
import 'package:bmicalculator/components/reuseable_widget.dart';
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

  double _value = 40.0;

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
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "HEIGHT",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontFamily: "English",
                                        fontSize: 30,
                                      ),
                                      text: "180",
                                      children: [
                                        TextSpan(text: "cm"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                "assets/images/height.png",
                                width: 200,
                              ),
                              SfSlider.vertical(
                                activeColor: Colors.pink,
                                inactiveColor: Colors.white,
                                min: 120.0,
                                max: 220.0,
                                value: _value,
                                interval: 20,
                                showTicks: true,
                                showLabels: true,
                                // enableTooltip: true,
                                minorTicksPerInterval: 1,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _value = value;
                                    print(_value.toInt());
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
                            child: ReuseableWidget.bottomCard("WEIGHT", 11),
                          ),
                          Expanded(
                            child: ReuseableWidget.bottomCard("AGE", 18),
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
              child: SizedBox.expand(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {},
                  child: const Text("CALCULATE YOUR BMI"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
