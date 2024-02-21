import 'package:calculator_app/COLORS/colors.dart';
import 'package:calculator_app/CONSTANTS/constants.dart';
import 'package:calculator_app/HELPER/font_name.dart';
import 'package:calculator_app/HELPER/get_color.dart';
import 'package:calculator_app/Provider/calculator_provider.dart';
import 'package:calculator_app/Provider/theme_provider.dart';
import 'package:calculator_app/WIDGETS/calculator_buttons.dart';
import 'package:calculator_app/WIDGETS/theme_changing_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool mode = Provider.of<ThemeProvider>(context).gettheme() ==
        CustomTheme.darkThemeMode;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 50),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "CipherCalc",
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'cavier',
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: const Color(0xff2B5D7D).withOpacity(.9),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<CalculatorState>(
                    builder: (context, calculatorstate, _) {
                  ScrollController scrollController = ScrollController();

                  //  Autoscroll to the end
                  void scrollToTheEnd() {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }

                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => scrollToTheEnd());
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        child: Text(
                          calculatorstate.userInput,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontName.font2,
                              color: Color(0xffA1AFBE)),
                        ),
                      ),
                      Text(
                        calculatorstate.answer,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 40,
                          fontFamily: FontName.font2,
                          color: Color(0xff3F718D),
                          fontWeight: FontWeight.bold,
                        ),
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
                  shrinkWrap: true,
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
                      color: getColor(
                          buttonText: buttons[index],
                          isDark: mode,
                          context: context),
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
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffA1AFBE),
                      fontFamily: FontName.font2,
                      fontWeight: FontWeight.bold),
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
