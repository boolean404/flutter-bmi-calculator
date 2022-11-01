import 'dart:math';

class CalculateBMI {
  CalculateBMI({required this.weight, required this.height});

  final int height;
  final int weight;

  double _bmi = 0.0;

  String getBMI() {
    _bmi = (weight / 2.2046) / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  double getIntBMI() {
    return _bmi;
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getMsg() {
    if (_bmi >= 25) {
      return "Oh!, You've a higher body weight than normal people. Try to exercise more.";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "Keep going!, You've normal body weight, Good job";
    } else {
      return "You need to eat more because you've a lower body weight than normal people.";
    }
  }
}
