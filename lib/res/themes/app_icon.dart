import 'package:flutter/material.dart';

//this is singleTon class ....which has single instance over whole app..means you cant create instances because constructure is private here 
class AppIcons {
  AppIcons._();
  static const fontFam = 'AppIcons';
  static const IconData trophyOutline = IconData(0xe808,fontFamily: fontFam);
  static const IconData menuLeft = IconData(0xe805,fontFamily: fontFam);
  static const IconData peace = IconData(0xe806,fontFamily: fontFam);
  static const IconData menu = IconData(0xe804,fontFamily: fontFam);
}