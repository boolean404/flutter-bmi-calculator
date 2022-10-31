import 'package:bmicalculator/components/app_colors.dart';
import 'package:bmicalculator/components/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmi;
  final String resultText;
  final String resultMsg;
  final Color color;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.resultText,
    required this.resultMsg,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Your BMI Result",
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
                child: SizedBox.expand(
                  child: Card(
                    color: AppColors.inactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/$resultText.png",
                          width: 100,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          resultText.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          bmi,
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        // Text(
                        //   "Normal BMI range:\n18.5 - 25",
                        //   textAlign: TextAlign.center,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            resultMsg,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(
                btnName: "Re - calculate BMI",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
