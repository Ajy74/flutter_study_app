import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widgets/app_circle_button.dart';

import '../../res/themes/app_color.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star,size: 65),
              const SizedBox(height: 40,),
              const Text('This is a study app. you can use it as you want. if you understand how it works you would be able to scale it. with this will master firrebase backend and flutter front end. ',
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40,),
              AppCircleButton(
                onPress: () {
                    Get.toNamed("/home_screen");
                },
                child: const Icon(Icons.arrow_forward,size: 35,),
        
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}