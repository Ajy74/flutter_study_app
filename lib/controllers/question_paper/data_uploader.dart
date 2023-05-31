import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/models/question_paper_model.dart';

import '../../firebase_ref/references.dart';

class DataUploader extends GetxController{
  
  @override
  void onReady(){

    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs; //making loadingStatus observable

  Future<void> uploadData()async{

    loadingStatus.value = LoadingStatus.loading; //here initialize as value=0 # because enum has start value from 0 and so on#

    final firestore = FirebaseFirestore.instance;   //getting instance of firebasefirestore

    final mainifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");   //it would be loading asset folder and 
    final Map<String,dynamic> manifestMap = json.decode(mainifestContent);  //decoding String data to json

    final paperInAssets = manifestMap.keys
      .where((path) => path.startsWith("assets/DB/paper") 
      && path.contains(".json")).toList();  // load file and print path below
      //  print(paperInAssets);

      List<QuestionPaperModel> questionPapers = [];

      for (var paper in paperInAssets){
        String stringPaperContent = await rootBundle.loadString(paper);  //paper contains each path String which is in paperInAssets
        // print(stringPaperContent);
        questionPapers.add(QuestionPaperModel.fromJson(jsonDecode(stringPaperContent)));  //adding data to list
      }
      
      // print("items number ${questionPapers[0].description}");

      var batch = firestore.batch();  // initializes a batch object that you can use to build up a series of write operations. 

      //........................for storing data with making collection and fields.......................................//
      for(var paper in questionPapers){

        batch.set(questionPaperRF.doc(paper.id), {
          "title":paper.title,
          "image_url":paper.imageUrl,
          "Description":paper.description,
          "time_seconds":paper.timeSeconds,
          "questions_count":paper.questions == null ? 0 : paper.questions!.length
        });

        for(var questions in paper.questions!){
           final questionPath = questionRF(paperId: paper.id, questionId: questions.id!);

           batch.set(questionPath, {
            "question":questions.question,
             "correct_answer": questions.correctAnswer
           } );

           for(var answer in questions.answers!){
              batch.set(
                questionPath.collection("answers").doc(answer.identifier),
                {
                    "identifier":answer.identifier,
                    "Answer":answer.answer
                }
              );
           }
        }

      }
      //........................for storing data with making collection and fields..............for loop end.........................//      

      await batch.commit();  //means submit everything in our firebasefirestore database as well creted above mentioned document,fields related to databse

      loadingStatus.value=LoadingStatus.completed; //here initialize as value=1 
  }



}