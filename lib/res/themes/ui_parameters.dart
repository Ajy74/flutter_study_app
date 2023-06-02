import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _mobileScreenpadding=25.0;
const double _cardBorderRadius=10.0;

 double get mobileScreenpadding => _mobileScreenpadding;

// double get mobileScreenpadding=> _mobileScreenpadding;
double get cardBorderRadius=> _cardBorderRadius;

class UIParameters{

  static BorderRadius get cardBorderRadius=>BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenpadding=>const EdgeInsets.all(_mobileScreenpadding);

  static bool isDarkMode(){
    return Get.isDarkMode?true:false;
  }
}