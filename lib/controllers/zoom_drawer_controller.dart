import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'auth_controller.dart';

class MyZoomDrawerController extends GetxController{
  
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer(){
      zoomDrawerController.toggle?.call();
      update();
  }

  void signOut(){
      Get.find<AuthController>().signOut();
  }

  void signIn(){
    
  }

  final _githubUri = Uri(
    scheme: 'https',
    host: 'github.com',
    path: '/Ajy74',
    );
  void website(){
    _launch(_githubUri);
  }
  void facebook(){
    _launch(_githubUri);
  }
  void github(){
    _launch(_githubUri);
  }

  void email(){
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'mouryaajay7463@gmail.com'
    );
    _launch(emailLaunchUri);
  }

  Future<void> _launch(Uri url)async{
    if(await launchUrl(url)){
      throw 'could not launch $url';
    }
  }

}