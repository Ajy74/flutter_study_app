import 'package:get/get.dart';

class AuthController extends GetxController{

  @override
  void onReady(){
    initAuth();
    super.onReady();
  }

  void initAuth(){
    navigateToIntroduction();
  }

  void navigateToIntroduction()async{
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed("/introduction_screen");
  }

}