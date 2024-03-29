
import 'package:flutter/material.dart';
import 'package:study_app/res/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColordark = Color(0xFF2e3c62); 
const Color primaryColorDark = Color(0xFF99ace1); 
const Color mainTextColorDark = Colors.white; 
const Color cardColorDark = Color.fromARGB(255, 254, 254, 255); 

class DarkTheme with SubThemeData{
  ThemeData buildDarkTheme(){
    final ThemeData systemDarkTheme =  ThemeData.dark();
    return systemDarkTheme.copyWith(
      primaryColor: primaryColorDark,
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark
      ),
      cardColor: cardColorDark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}