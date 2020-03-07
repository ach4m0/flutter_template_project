import 'package:flutter/material.dart';

import 'package:flutter_template_project/ui/shared/text_styles.dart';
import 'package:flutter_template_project/ui/shared/app_colors.dart';

ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.black[900],
  errorColor: AppColors.red[900],
  primaryColorBrightness: Brightness.light,
  accentColor: AppColors.yellow[900],
  accentColorBrightness: Brightness.light,
  textTheme: textTheme,
);
