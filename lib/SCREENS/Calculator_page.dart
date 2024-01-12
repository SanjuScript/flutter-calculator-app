import 'package:calculator_app/COLORS/colors.dart';
import 'package:calculator_app/CONSTANTS/constants.dart';
import 'package:calculator_app/HELPER/get_color.dart';
import 'package:calculator_app/Provider/calculator_provider.dart';
import 'package:calculator_app/Provider/theme_provider.dart';
import 'package:calculator_app/WIDGETS/calculator_buttons.dart';
import 'package:calculator_app/WIDGETS/theme_changing_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 40),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "CipherCalc",
              style: TextStyle(
                shadows: const [
                  BoxShadow(
                    color: Color(0xffB6D1DF),
                    blurRadius: 15,
                    offset: Offset(-2, 2),
                  ),
                ],
                fontSize: 28,
                fontFamily: 'rounder',
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: const Color(0xff2B5D7D).withOpacity(.9),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              // margin: const EdgeInsets.symmetric(horizontal: 5),
              // decoration: BoxDecoration(
              //   color: const Color(0xffD4E8FA),
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(color: Colors.white),
              // ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<CalculatorState>(
                    builder: (context, calculatorstate, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        calculatorstate.answer,
                        style: const TextStyle(
                            fontSize: 25, color: Color(0xffA1AFBE)),
                      ),
                      Text(
                        calculatorstate.userInput,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 45,
                            fontFamily: 'rounder',
                            color: Color(0xff3F718D),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Consumer<CalculatorState>(builder: (context, calculatorstate, _) {
              return Expanded(
                flex: 3,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buttons.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CalculatorButton(
                    
                      buttonText: buttons[index],
                      color: getColor(buttons[index]),
                      buttontapped: () {
                        calculatorstate.onButtonTap(buttons[index]);
                      },
                    );
                  },
                ),
              );
            }),
          
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'ThemeMode',
                  style: TextStyle(fontSize: 16, color: Color(0xffA1AFBE)),
                ),
                ChangeThemeButtonWidget()
              ],
            )
          ],
        ),
      ),
    );
  } 
}
