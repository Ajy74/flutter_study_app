import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/bindings/initial_bindings.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/res/themes/app_dark_theme.dart';
import 'package:study_app/res/themes/app_light_theme.dart';
import 'package:study_app/data_uploader_screen.dart';
import 'package:study_app/routes/routes.dart';
import 'firebase_options.dart';


/*  this code is for uploading data to firebase database to reduce manual work 
Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( GetMaterialApp(home: DataUploaderScreen(),));
}
*/

void main(){
  WidgetsFlutterBinding.ensureInitialized(); //use to waits for all the bindings to be done then proceeds other app process
  InitialBindings().dependencies(); 
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Study App',
      // theme: LightTheme().buildLightTheme(),
      theme: Get.find<ThemeController>().lightTheme ,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes(),
    );
  }
}


