import 'package:flutter/material.dart';

Color getColor({required String buttonText, required bool isDark,required BuildContext context}) {
  final Map<String, Color> colors = {
    '+': Theme.of(context).highlightColor,
    '-': Theme.of(context).highlightColor,
    'x': Theme.of(context).highlightColor,
    'DEL': Theme.of(context).highlightColor,
    '=': Theme.of(context).focusColor,
    'C': Theme.of(context).hintColor,
  };

  final int opacityIndex = isDark ? 0 : 1;
  final int opacity = [0, 255][opacityIndex];

  return colors.containsKey(buttonText)
      ? colors[buttonText]!.withOpacity(opacity / 255)
      : Colors.blue.withOpacity(opacity / 255);
}
