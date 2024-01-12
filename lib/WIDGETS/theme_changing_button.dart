import 'package:calculator_app/Provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../COLORS/colors.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  final bool visibility; // Corrected spelling
  final bool changeICon;
  const ChangeThemeButtonWidget({
    Key? key,
    this.visibility = false,
    this.changeICon = false,
  }) : super(key: key);

  @override
  State<ChangeThemeButtonWidget> createState() =>
      _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  late bool _darkTheme;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _darkTheme = (themeProvider.gettheme() == CustomTheme.lightThemeMode);
  }

  void _toggleTheme(ThemeProvider themeProvider) {
    setState(() {
      _darkTheme = !_darkTheme;
    });
    onThemeChanged(_darkTheme, themeProvider);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    _darkTheme = (themeProvider.gettheme() == CustomTheme.lightThemeMode);
    if (widget.changeICon) {
      return Switch.adaptive(
          value: _darkTheme,
          onChanged: (value) {
         _toggleTheme(themeProvider);
          },
          // activeColor: Colors.black,
          // activeTrackColor: Colors.grey[300],
          // inactiveThumbColor: Colors.white,
          // inactiveTrackColor: Colors.grey[700],
        );
    } else {
      return IconButton(
        icon: Icon(
          _darkTheme ? Icons.dark_mode : Icons.light_mode,
          color: _darkTheme ? Colors.black : Colors.white,
        ),
        onPressed: () => _toggleTheme(themeProvider),
      );
    }
  }

  void onThemeChanged(bool value, ThemeProvider themeProvider) async {
    value
        ? themeProvider.setTheme(CustomTheme.lightThemeMode)
        : themeProvider.setTheme(CustomTheme.darkThemeMode);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
