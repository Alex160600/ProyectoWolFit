import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorMediumPriority = Colors.yellow;
  static final Color colorHighPriority = Colors.red;
  static final Color colorLowPriority = Colors.green.shade400;

  static final TextTheme textTheme = TextTheme(
    displayLarge: _headLine1,
    displayMedium: _headLine2,
    displaySmall: _headLine3,
    headlineMedium: _headLine4,
    headlineSmall: _headLine5,
    titleLarge: _headLine6,
    bodyLarge: _bodyText1,
    bodyMedium: _bodyText2,
    titleMedium: _subTitle1,
    titleSmall: _subTitle2,
    bodySmall: _caption,
  );

  static const TextStyle _headLine1 =
      TextStyle(fontFamily: 'Nexa', fontWeight: FontWeight.bold);

  static final TextStyle _headLine2 = _headLine1.copyWith();
  static final TextStyle _headLine3 = _headLine2.copyWith();
  static const TextStyle _headLine4 =
      TextStyle(fontFamily: 'Nexa', fontWeight: FontWeight.normal);
  static final TextStyle _headLine5 = _headLine4.copyWith();
  static final TextStyle _headLine6 =
      _headLine5.copyWith(fontFamily: 'Akrobat');
  static final TextStyle _subTitle1 = _headLine6.copyWith();
  static final TextStyle _subTitle2 = _subTitle1.copyWith();
  static final TextStyle _bodyText1 = _subTitle2.copyWith();
  static final TextStyle _bodyText2 = _bodyText1.copyWith();
  static final TextStyle _caption = _bodyText2.copyWith();

  static ThemeData themeData(bool ligthMode) {
    return ThemeData(
        textTheme: textTheme,
        brightness: ligthMode ? Brightness.light : Brightness.dark);
  }
}
