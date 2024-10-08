import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class CustomCheckboxTheme {
  CustomCheckboxTheme._();

  /// Checkbox For Light Theme
  static final CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return CustomColors.WHITE;
        } else {
          return CustomColors.BLACK;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return CustomColors.GREEN_DARK;
        } else {
          return CustomColors.TRANSPARENT;
        }
      }));

  /// Checkbox For Dark Theme
  static final CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return CustomColors.BLACK;
        } else {
          return CustomColors.WHITE;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return CustomColors.GREEN_LIGHT;
        } else {
          return CustomColors.TRANSPARENT;
        }
      }));
}
