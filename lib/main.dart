import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/data_uploader_screen.dart';

import 'firebase_options.dart';

Future<void> main()async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Study App',
      // theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      // themeMode: ThemeServices().theme,
      debugShowCheckedModeBanner: false,
      // getPages: AppRoutes.appRoutes(),
      home: DataUploaderScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
   return Container();
  }
}

