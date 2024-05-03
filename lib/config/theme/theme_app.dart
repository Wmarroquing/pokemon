import 'package:flutter/material.dart';
import 'package:pokemon/config/theme/theme.dart';

final lightTheme = ThemeData(
  primaryColor: mainColor,
  useMaterial3: true,
  textTheme: appCustomFont,
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(mainColor)
    )
  ),
  cardTheme: CardTheme(
    color: mainColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
  )
);