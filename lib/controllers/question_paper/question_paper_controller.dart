import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/models/question_paper_model.dart';

import '../../firebase_options.dart';
import '../../services/firebase_storage_services.dart';

class QuestionPaperController extends GetxController{

  FirebaseStorageService firebaseStorageService = Get.put(FirebaseStorageService());

  // final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async{
    // List<String> imgName = ["biology","chemistry","maths","physics"];
    try {
      
      QuerySnapshot<Map<String,dynamic>> data = await questionPaperRF.get();
      final paperList =  data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
     
      // for(var img in imgName){
      //  final imgUrl = await  Get.find<FirebaseStorageService>().getImage(img); //getting image path from firebase storage using FirebaseStorageService
      //  //here Get.find is used to connect with service as (auto find instance )
      // //  final imgUrl = await firebaseStorageService.getImage(img);
      //  allPaperImages.add(imgUrl!);
      // }
      for(var paper in paperList){
        final imgUrl = await  Get.find<FirebaseStorageService>().getImage(paper.title); 
        //  final imgUrl = await firebaseStorageService.getImage(img);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);

    } catch (e) {
      print("qpc..error..$e");
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain=false}){
    AuthController _authController = Get.find(); 
    if(_authController.isLoggedIn()){
      if(tryAgain){
        Get.back();
        //Get.offNamed()
      }
      else{
        Get.toNamed("/question_screen",arguments: paper);
      }
    }
    else{
      print("not logged...${paper.title}");
      _authController.showLoginAlertDialogue();
    }
  }

}