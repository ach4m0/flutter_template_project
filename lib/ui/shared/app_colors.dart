import 'package:flutter/material.dart';

class AppColors {

  static const backgroundColor = Color(0xFFFFFFFF);
  static const onBackgroundColor = Color(0xFF000000);
  static const primaryColor = Color(0xFF000000);
  static const onPrimaryColor = Color(0xFFFFFFFF);
  static const secondaryColor = Color(0xFFF1C40F);
  static const onSecondaryColor = Color(0xFFFFFFFF);
  static const errorColor = Color(0xFFD50000);
  static const onErrorColor = Color(0xFFFFFFFF);
  static const surfaceColor = Color(0xFFFFFFFF);
  static const onSurfaceColor = Color(0xFFFFFFFF);

  static const ColorScheme colorScheme = ColorScheme(
    background: backgroundColor,
    onBackground: onBackgroundColor,
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    primaryVariant: primaryColor,
    secondary: secondaryColor,
    onSecondary: onSecondaryColor,
    secondaryVariant: secondaryColor,
    brightness: Brightness.light,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
    error: errorColor,
    onError: onErrorColor,
  );

}
