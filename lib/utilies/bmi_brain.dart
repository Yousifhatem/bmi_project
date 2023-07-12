import 'dart:math';

class BMIBrain {
  double weight;
  double height;
  int age;
  late double _result;

  BMIBrain({this.height = 120, this.weight = 60, this.age = 23});

  double calculateBMI() {
    _result = weight / pow(height / 100, 2).round();
    return _result;
  }

  String checkBMIResult() {
    if (_result > 25) {
      return 'Overweight';
    } else if (_result >= 18.5) {
      return 'Normal';
    } else {
      return 'Under weight';
    }
  }

  String getInterpretation() {
    if (_result >= 25) {
      return 'You have a higher than normal body weight.try to exercise more.';
    } else if (_result > 18.5) {
      return 'You have a normal body weight.Good job ';
    } else {
      return 'You have a lower than normal body weight.You can eat a bit more';
    }
  }
}
