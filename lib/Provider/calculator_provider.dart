import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorState with ChangeNotifier {
  String _userInput = '';
  String _answer = '';
  bool _showUserInput = false;

  String get userInput => _userInput;
  String get answer => _answer;
  bool get showUserInput => _showUserInput;

  void onButtonTap(String buttonText) {
    try {
      if (buttonText == 'C') {
        _userInput = '';
        _answer = '';
        _showUserInput = false;
      } else if (buttonText == '=') {
        if (_userInput.isNotEmpty) {
          equalPressed();
          _showUserInput = true;
        }
      } else if (buttonText == 'DEL') {
        if (_userInput.isNotEmpty) {
          _userInput = _userInput.substring(0, _userInput.length - 1);
        }
      } else {
        _userInput += buttonText;
      }

      notifyListeners();
    } catch (e) {
      _answer = "Error";
    }
  }

  void equalPressed() {
    String finaluserinput = _userInput;
    finaluserinput = finaluserinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    // Check if the result is an integer (no decimal part)
    if (eval % 1 == 0) {
      _answer = eval.toInt().toString();
    } else {
      _answer = eval.toString();
    }

    notifyListeners();
  }
}
