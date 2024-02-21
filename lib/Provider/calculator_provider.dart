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
        clear();
      } else if (buttonText == '=') {
        evaluate();
      } else if (buttonText == 'DEL') {
        deleteLastCharacter();
      } else {
        appendInput(buttonText);
      }
    } catch (e) {
      _answer = "Error";
    } finally {
      notifyListeners();
    }
  }

  void clear() {
    _userInput = '';
    _answer = '';
    _showUserInput = false;
  }

  void evaluate() {
    if (_userInput.isNotEmpty) {
      String finalUserInput = _userInput.replaceAll('x', '*');
      final Parser p = Parser();
      final Expression exp = p.parse(finalUserInput);
      final ContextModel cm = ContextModel();
      final double eval = exp.evaluate(EvaluationType.REAL, cm);

      // result formatting
      _answer = eval.toStringAsFixed(eval.truncateToDouble() == eval ? 0 : 2);
      _showUserInput = true;
    }
  }

  void deleteLastCharacter() {
    if (_userInput.isNotEmpty) {
      _userInput = _userInput.substring(0, _userInput.length - 1);
    }
  }

  void appendInput(String input) {
    _userInput += input;
  }
}
