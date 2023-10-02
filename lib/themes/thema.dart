import 'package:flutter/material.dart';

const brightness = Brightness.light;

ThemeData appTheme() {
  return ThemeData(
    //useMaterial3: true,
    brightness: brightness,
    // textTheme: const TextTheme(
    //   bodyText1: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   bodyText2: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   button: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   caption: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   headline1: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   headline2: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   headline3: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   headline4: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   headline5: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   headline6: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   subtitle1: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    //   subtitle2: TextStyle(
    //     fontFamily: "OpenSans",
    //   ),
    // ),
    
    scaffoldBackgroundColor: Color.fromARGB(255, 238, 243, 246),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color.fromARGB(255, 22, 71, 61),
      secondary: Color.fromARGB(255, 22, 71, 61),
    ),
  );
}
