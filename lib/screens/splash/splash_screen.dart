import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/res/themes/app_color.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset("assets/images/app_splash_logo.png",width: 200, height: 200,),
      ),
    );
  }
  

}