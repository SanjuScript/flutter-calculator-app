import 'package:flutter/material.dart';

class UserInputText extends StatelessWidget {
  final String text;
  const UserInputText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'user',
      child: Text(
        text ?? '',
        style: const TextStyle(fontSize: 25, color: Color(0xffA1AFBE)),
      ),
    );
  }
}
