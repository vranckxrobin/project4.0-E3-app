import 'package:flutter/material.dart';

MaterialColor garnotecColor = const MaterialColor(
  0xFF1964A1,
  const <int, Color>{
    50: const Color.fromRGBO(25, 100, 161, .1),
    100: const Color.fromRGBO(25, 100, 161, .2),
    200: const Color.fromRGBO(25, 100, 161, .3),
    300: const Color.fromRGBO(25, 100, 161, .4),
    400: const Color.fromRGBO(25, 100, 161, .5),
    500: const Color.fromRGBO(25, 100, 161, .6),
    600: const Color.fromRGBO(25, 100, 161, .7),
    700: const Color.fromRGBO(25, 100, 161, .8),
    800: const Color.fromRGBO(25, 100, 161, .9),
    900: const Color.fromRGBO(25, 100, 161, 1),
  },
);

const gshopErrorRed = Color(0xFFC5032B);
const gShopBackgroundWhite = Color(0xFFF0F0F0);
const gshopCMT = Color(0xFFF88604);

const gshopAccent = Color(0xFF9EA0A9);

final ThemeData gShopTheme = _buildGshopTheme();

ThemeData _buildGshopTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: gshopAccent,
      primaryColor: garnotecColor,
      canvasColor: Colors.transparent,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: garnotecColor.shade100,
        colorScheme: base.colorScheme.copyWith(
          secondary: garnotecColor.shade900,
        ),
        textTheme: ButtonTextTheme.primary,
      ),
      buttonBarTheme: base.buttonBarTheme.copyWith(
        buttonTextTheme: ButtonTextTheme.accent,
      ),
      buttonColor: garnotecColor,
      scaffoldBackgroundColor: gShopBackgroundWhite,
      // textSelectionColor: garnotecColor.shade100,
      errorColor: gshopErrorRed,
      textTheme: _buildGshopTextTheme(base.textTheme),
      primaryTextTheme: _buildGshopTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildGshopTextTheme(base.accentTextTheme),
      primaryColorLight: garnotecColor.shade200,
      indicatorColor: gshopCMT,
      primaryIconTheme: IconThemeData(color: gshopAccent),
      iconTheme: IconThemeData(color: gshopAccent),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: gshopAccent,
      ));
}

TextTheme _buildGshopTextTheme(TextTheme base) {
  return base
      .copyWith(
          bodyText2: base.bodyText2.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: gshopAccent,
          ),
          headline2: base.headline2.copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: garnotecColor.shade900,
          ),
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
            decorationColor: Colors.black,
            color: Colors.black,
          ),
          headline6: base.headline6.copyWith(fontSize: 18.0),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          bodyText1: base.bodyText1.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
          button: base.button.copyWith(
            fontFamily: 'Poppins-SemiBold',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ))
      .apply(
          // fontFamily: 'Poppins',
          // displayColor: garnotecColor.shade900,
          // bodyColor: garnotecColor.shade900,
          );
}
