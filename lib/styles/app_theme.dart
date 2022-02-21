import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
    fontFamily: 'Roboto',
    primarySwatch: kPrimaryColor,
    primaryColor: primaryColor);

const String appLogo = 'assets/images/icons/logo.png';

// Colors //
const KColor1 = Color(0xFF333333);
const KColor2 = Color(0xFF828282);
const primaryColor = Color(0xFFEC726F);
const kDark = Color(0xFF757575);
const kLightGray = Color(0xFFDCDCDC);

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFFEC726F,
  const <int, Color>{
    50: const Color(0xFFEC726F),
    100: const Color(0xFFEC726F),
    200: const Color(0xFFEC726F),
    300: const Color(0xFFEC726F),
    400: const Color(0xFFEC726F),
    500: const Color(0xFFEC726F),
    600: const Color(0xFFEC726F),
    700: const Color(0xFFEC726F),
    800: const Color(0xFFEC726F),
    900: const Color(0xFFEC726F),
  },
);

// TextStyle //
const titlesStyle = TextStyle(
  letterSpacing: 1.5,
  color: primaryColor,
  fontSize: 30,
);

const kLogoStyle = TextStyle(
    letterSpacing: 2,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 26);

const smallStyle = TextStyle(color: kDark, fontSize: 14);

double defSpacing = 16.0;

// InputBorders //
InputBorder kLoginInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(defSpacing * 1.25),
    borderSide: BorderSide(color: Colors.white));

InputBorder kSignInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(defSpacing * .75),
    borderSide: BorderSide(color: primaryColor));

InputBorder kCustomInputBorderB = OutlineInputBorder(
    borderRadius: BorderRadius.circular(defSpacing),
    borderSide: BorderSide(width: 0, style: BorderStyle.none));
