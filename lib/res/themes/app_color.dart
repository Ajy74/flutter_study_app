import 'package:flutter/material.dart';
import 'package:study_app/res/themes/app_dark_theme.dart';
import 'package:study_app/res/themes/app_light_theme.dart';
import 'package:study_app/res/themes/ui_parameters.dart';


const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight
  ],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColordark,
    primaryColorDark
  ],
);

//check is darkMOde or not then return accordingly specified linear gradient
LinearGradient mainGradient(BuildContext context)=> UIParameters.isDarkMode(context)?mainGradientDark:mainGradientLight ;