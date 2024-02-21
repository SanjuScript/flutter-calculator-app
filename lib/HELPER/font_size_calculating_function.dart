import 'package:flutter/material.dart';

double calculateFontSize(BuildContext context, String text) {
  final screenWidth = MediaQuery.of(context).size.width;
  final textLength = text.length;
  final fontSize = screenWidth / textLength * 1.4;
  return fontSize.clamp(10.0, 45.0); //min max
}
