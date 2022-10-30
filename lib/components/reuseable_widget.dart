import 'package:flutter/material.dart';

class ReuseableWidget {
  static Widget genderCard(String gender, String genderName, Color color) {
    return Card(
      color: color,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              Image.asset(
                "assets/images/$gender.png",
                width: 100,
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
      ),
    );
  }
}
