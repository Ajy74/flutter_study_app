import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/models/question_paper_model.dart';

class DataUploader extends GetxController{
  
  @override
  void onReady(){

    uploadData();
    super.onReady();
  }

  Future<void> uploadData()async{
    final mainifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");   //it would be loading asset folder and 

    final Map<String,dynamic> manifestMap = json.decode(mainifestContent);

// load file and print path
    final paperInAssets = manifestMap.keys
      .where((path) => path.startsWith("assets/DB/paper") 
      && 
      path.contains(".json")).toList();
      // print(paperInAssets);

      List<QuestionPaperModel> questionPapers = [];

      for (var paper in paperInAssets){
        String stringPaperContent = await rootBundle.loadString(paper);  //paper contains each path String which is in paperInAssets
        // print(stringPaperContent);
        questionPapers.add(QuestionPaperModel.fromJson(jsonDecode(stringPaperContent)));
      }
      print("items number ${questionPapers[0].description}");
  }

}