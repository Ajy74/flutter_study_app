import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:study_app/res/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb); 
const Color primaryColorLight = Color(0xFFf85187); 
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40); 
const Color cardColorLight = Color.fromARGB(255, 254, 254, 255); 

class LightTheme with SubThemeData{
  ThemeData buildLightTheme(){
    final ThemeData systemLightTheme =  ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: primaryColorLight,
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight
      ),
      cardColor: cardColorLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // progressIndicatorTheme: 
    );
  }
}

