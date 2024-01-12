import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final void Function() buttontapped;
  final int index;
  final String buttonText;
  final Color color;
  const CalculatorButton(
      {super.key,
      required this.buttontapped,
      required this.buttonText,
      this.index = 0,
      this.color = const Color(0xff49A2F1)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: Container(
          decoration: BoxDecoration(
              color: color.withOpacity(.9),
              border: Border.all(color: color, width: 2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color:color.withOpacity(.9),
                    spreadRadius: 2,
                    offset: Offset(2, -2)),
                BoxShadow(
                    color: color,
                    blurRadius: 8,
                    offset: Offset(-2, 2))
              ]),
          child: Center(
            child: Text(
              index != 0 ? '÷' : buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
