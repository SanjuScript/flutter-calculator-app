import 'package:calculator_app/COLORS/colors.dart';
import 'package:calculator_app/Provider/calculator_provider.dart';
import 'package:calculator_app/Provider/theme_provider.dart';
import 'package:calculator_app/SCREENS/Calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then(
    (value) {
      var darkModeON = value.getBool('darkMode') ?? true;
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CalculatorState(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(darkModeON
                ? CustomTheme.lightThemeMode
                : CustomTheme.darkThemeMode),
          ),
        ],
        child: const MyApp(),
      ));
    },
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(0, 0, 0, 0),
        statusBarIconBrightness: Brightness.dark),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.gettheme(),
        home: const CalculatorPage(),
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarIconBrightness:
                  themeProvider.gettheme() == CustomTheme.darkThemeMode
                      ? Brightness.light
                      : Brightness.dark,
              // ... other style configurations
            ),
          );
          return child!;
        },
      );
    });
  }
}
