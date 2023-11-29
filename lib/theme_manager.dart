// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ArcheTheme {
  static Color pd = Color.fromARGB(255, 3, 5, 66);
  static Color opd = Color.fromARGB(255, 154, 154, 178);
  static Color pdc = Color.fromARGB(255, 82, 84, 125);
  static Color opdc = Color.fromARGB(255, 227, 227, 235);

  static Color pl = opdc;

  static Color opl = pdc;
  static Color plc = opd;
  static Color oplc = pd;

  static TextTheme lightTextTheme = TextTheme(
    // bodyMedium: ,
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: opl),
    displayLarge:
        TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: opl),
    displayMedium:
        TextStyle(fontSize: 21, fontWeight: FontWeight.w700, color: opl),
    displaySmall:
        TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: opl),
    titleLarge:
        TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: opl),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodySmall:
        TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600, color: opd),
    bodyLarge:
        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: opd),
    displayLarge:
        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: opd),
    displayMedium:
        TextStyle(fontSize: 21.0, fontWeight: FontWeight.w700, color: opd),
    displaySmall:
        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: opd),
    titleLarge:
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: opd),
  );
  static AppBarTheme lightAppBarTheme = AppBarTheme(
      // color: Colors.black,
      actionsIconTheme: IconThemeData(color: opl),
      iconTheme: IconThemeData(
        color: opl,
      ),
      backgroundColor: (pd),
      elevation: 0,
      titleTextStyle:
          TextStyle(color: opl, fontWeight: FontWeight.normal, fontSize: 18.0));
  static AppBarTheme darkAppBarTheme = AppBarTheme(
      actionsIconTheme: IconThemeData(color: opd),
      backgroundColor: (pd),
      elevation: 0,
      titleTextStyle:
          TextStyle(color: opd, fontWeight: FontWeight.normal, fontSize: 18.0));

  static BottomAppBarTheme darkBottomAppBarTheme = BottomAppBarTheme(
    color: pd,
    elevation: 0,
  );

  static BottomNavigationBarThemeData lightBottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
    selectedItemColor: opl,
  );

  static BottomNavigationBarThemeData darkBottomNavigationBarThemeData =
      BottomNavigationBarThemeData(selectedItemColor: opd, backgroundColor: pd);
  static TextSelectionThemeData lightTextSelectionThemeData =
      TextSelectionThemeData(
    cursorColor: oplc,
  );
  static TextButtonThemeData lightTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(foregroundColor: MaterialStateProperty.all(oplc)),
  );
  static TextButtonThemeData darkTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(foregroundColor: MaterialStateProperty.all(opdc)),
  );

  static ThemeData light() {
    return ThemeData(
      // datePickerTheme: DatePickerThemeData(color),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStatePropertyAll(plc),
      ),
      // radioTheme: RadioThemeData(
      //     fillColor: MaterialStateColor.resolveWith(
      //         (states) => Color.fromARGB(255, 69, 22, 147))),
      disabledColor: Colors.grey,
      buttonTheme: ButtonThemeData(disabledColor: Colors.grey),
      textButtonTheme: lightTextButtonThemeData,
      // primaryColorLight: Color.fromARGB(255, 188, 66, 174),
      textSelectionTheme: lightTextSelectionThemeData,
      hoverColor: Colors.transparent,
      appBarTheme: lightAppBarTheme,
      bottomNavigationBarTheme: lightBottomNavigationBarThemeData,
      // colorSchemeSeed:
      brightness: Brightness.light,
      // primaryColor: Color.fromARGB(255, 69, 22, 147),
      colorSchemeSeed: Color.fromARGB(255, 69, 22, 147),
      hintColor: Colors.black,
      // textSelectionTheme:
      //     const TextSelectionThemeData(selectionColor: Colors.green),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: pd,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStatePropertyAll(plc),
      ),

      disabledColor: Colors.grey,
      buttonTheme: ButtonThemeData(disabledColor: Colors.grey),
      textButtonTheme: darkTextButtonThemeData,

      textTheme: darkTextTheme,
      hoverColor: Colors.transparent,
      appBarTheme: darkAppBarTheme,
      bottomNavigationBarTheme: darkBottomNavigationBarThemeData,

      brightness: Brightness.dark,

      colorSchemeSeed: pd,
      hintColor: Colors.green,

      // textTheme: lightTextTheme,
    );
  }
}
