import 'package:flutter/material.dart';

class CustomTheme {
  static final lightThemeMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xffD4E8FA),
    //del,x,-,+ button
    highlightColor: const Color.fromARGB(255, 223, 156, 47),
    //= button
    focusColor: const Color.fromARGB(255, 76, 196, 110),
    //c button
    hintColor: const Color.fromARGB(255, 243, 103, 107),
    //text color
    cardColor: Colors.white
  );

  static final darkThemeMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 25, 27, 28),
    //del,x,-,+ button
    highlightColor: const Color.fromARGB(255, 223, 156, 47),
    //= button
    focusColor: const Color.fromARGB(255, 76, 196, 110),
    //c button
    hintColor: const Color.fromARGB(255, 243, 103, 107),
    //text color
    cardColor: Colors.black
  );
}
