import 'package:flutter/material.dart';

import 'app_colors.dart';

class ReuseableWidget {
  static Widget genderCard(String gender, String genderName, Color color) {
    return Card(
      color: color,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/$gender.png",
              height: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              genderName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget bottomCard(String titleText, String valueNo, Widget widget) {
    return Card(
      color: AppColors.inactiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            valueNo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
