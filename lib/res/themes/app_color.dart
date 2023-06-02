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
LinearGradient mainGradient()=> UIParameters.isDarkMode()?mainGradientDark:mainGradientLight ;


Color customScafoldColor(BuildContext context)=> 
    UIParameters.isDarkMode()?const Color(0xFF2e3c62):const Color.fromARGB(255, 240, 237, 255);