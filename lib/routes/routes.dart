import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:study_app/routes/routes_name.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/screens/question/question_screen.dart';
import 'package:study_app/screens/question/result_screen.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

import '../controllers/question_paper/question_controller.dart';
import '../screens/introduction/introduction.dart';
import '../screens/question/test_overview_screen.dart';

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

    GetPage(
      name: RoutesName.loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 250) ,
    ),

    GetPage(
      name: RoutesName.homeScreen,
      page: () =>  HomeScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 250) ,
      binding: BindingsBuilder(() {
        Get.put(QuestionPaperController());
        Get.put(MyZoomDrawerController());
      })
    ),

    GetPage(
      name: RoutesName.questionScreen,
      page: () =>  QuestionScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 250) ,
      binding: BindingsBuilder(() {   //uses for onReady if used for this page
        Get.put<QuestionController>(QuestionController());
      })
    ),

    GetPage(
      name: RoutesName.testOverviewScreen,
      page: () =>  TestOverviewScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 250) ,
      // binding: BindingsBuilder(() {   //uses for onReady if used for this page
      //   Get.put(QuestionController());
      // })
    ),

    GetPage(
      name: RoutesName.resultScreen,
      page: () =>  ResultScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 250) ,
      // binding: BindingsBuilder(() {   //uses for onReady if used for this page
      //   Get.put(QuestionController());
      // })
    ),

  ];

}