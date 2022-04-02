import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/style/font_family.dart';
import 'package:flutter/material.dart';

class CustomTheme{
  static ColorScheme get colorScheme{
    return const ColorScheme(
      primary: ColorPalette.emerald, 
      secondary: ColorPalette.algaeGreen,
      onSecondary: ColorPalette.white,
        onPrimary: ColorPalette.white, 
        surface: ColorPalette.white,  background: ColorPalette.white, 
        onBackground: ColorPalette.doveGrey, onSurface: ColorPalette.dustyGray, brightness: Brightness.light, 
        error: ColorPalette.yourPink, onError: ColorPalette.white
       );
  }
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: FontFamily.sfProRounded,
      primaryColor: ColorPalette.emerald,
      primaryColorLight: ColorPalette.algaeGreen,
      // primaryColorDark: ColorPalette.prussianBlue,
      backgroundColor: ColorPalette.white,
      scaffoldBackgroundColor: ColorPalette.white,
      colorScheme: colorScheme,
    );
  }

}