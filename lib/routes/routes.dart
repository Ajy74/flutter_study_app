import 'package:get/get.dart';
import 'package:study_app/routes/routes_name.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

import '../screens/introduction/introduction.dart';

class AppRoutes{

  static appRoutes()=>[

    GetPage(
      name: RoutesName.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 250) ,
    ),

    GetPage(
      name: RoutesName.introductionScreen,
      page: () => const AppIntroductionScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 250) ,
    ),

  ];

}