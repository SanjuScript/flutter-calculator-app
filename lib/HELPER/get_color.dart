  import 'package:flutter/material.dart';

Color getColor(String buttonText) {
    if (['+', '-', 'x', 'DEL'].contains(buttonText)) {
      return const Color.fromARGB(255, 223, 156, 47);
    } else if (buttonText == '=') {
      return const Color.fromARGB(255, 76, 196, 110);
    } else if (buttonText == 'C') {
      return const Color(0xffF3676B);
    } else {
      return const Color(0xff49A2F1);
    }
  }
