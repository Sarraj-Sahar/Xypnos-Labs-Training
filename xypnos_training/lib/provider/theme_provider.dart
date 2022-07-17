import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xypnos_training/constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(),
    accentColor: Color(0xFF4AB9CB),
    scaffoldBackgroundColor: Color(0xFF060a14),
    buttonColor: Color(0xFF1e1e1e),
    cardColor: Color(0xFF383838),
    // shadowColor: Color(0xFF404040),
    fontFamily: "Questrial",
    appBarTheme: appBarThemeDark(),
    textTheme: textThemeDark(),
    inputDecorationTheme: inputDecorationThemeDark(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: Colors.white,
  );

/******************************************************************/
/******************************************************************/
/******************************************************************/

  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Color(0xFF4AB9CB),
    backgroundColor: Colors.white.withOpacity(0.8),
    scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
    // colorScheme: ColorScheme.light(),

    // buttonColor: Colors.white,
    fontFamily: "Questrial",
    cardColor: Colors.white,
    // shadowColor: Color(0xFF404040),
    appBarTheme: appBarThemeLight(),
    textTheme: textThemeLight(),
    inputDecorationTheme: inputDecorationThemeLight(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: kTextColor,
  );
}

/*Dark Theme */

InputDecorationTheme inputDecorationThemeDark() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    hintStyle: TextStyle(color: Colors.white.withAlpha(80)),
  );
}

TextTheme textThemeDark() {
  return TextTheme(
    bodyText1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(color: Colors.white),
  );
}

AppBarTheme appBarThemeDark() {
  return AppBarTheme(
    color: Color(0xFF060a14),
    elevation: 0,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}

//**** LIGHT THEME ****************

InputDecorationTheme inputDecorationThemeLight() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    labelStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.grey),
  );
}

TextTheme textThemeLight() {
  return TextTheme(
    bodyText1: TextStyle(color: Color(0xFF121e3b), fontWeight: FontWeight.bold),
    // bodyText2: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: Color(0xFF121e3b).withOpacity(0.8)),
  );
}

AppBarTheme appBarThemeLight() {
  return AppBarTheme(
    color: Colors.white.withOpacity(0.8),
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}
