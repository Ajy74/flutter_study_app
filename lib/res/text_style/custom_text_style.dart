import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/res/themes/app_color.dart';

import '../themes/ui_parameters.dart';

TextStyle cardTitles(context)=>TextStyle(
  color: UIParameters.isDarkMode()?Theme.of(context).textTheme.bodyLarge!.color:Theme.of(context). primaryColor,
  fontSize: 18,
  fontWeight: FontWeight.bold
);
TextStyle detailedText=TextStyle(fontSize: 12,);
TextStyle headerText=TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: onSurfaceTextColor);

TextStyle questionText=TextStyle(fontSize: 16,fontWeight: FontWeight.bold);

TextStyle appBarText=TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: onSurfaceTextColor);

TextStyle countDownTimerTs()=>TextStyle(
  letterSpacing: 2,
  color: UIParameters.isDarkMode()?Theme.of(Get.context!).textTheme.bodyLarge!.color:Theme.of(Get.context!).primaryColor,
);