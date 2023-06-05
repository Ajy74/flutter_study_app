import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/models/question_paper_model.dart';

import '../../firebase_ref/references.dart';

class QuestionController extends GetxController{

  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];

  Rxn<Questions> currentQuestion = Rxn<Questions>();

  final loadingStatus = LoadingStatus.loading.obs;
  final questionIndex=0.obs;

  bool get isFirstQuestion => questionIndex.value>0;
  bool get isLastQuestion => questionIndex.value>=allQuestions.length-1;

  //Timer
  Timer? _timer;
  int remainSeconds=1;
  final time='00:00'.obs;
  //Timer

  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    // print(_questionPaper.title);
    loadData(_questionPaper);
    super.onReady();
  }


  Future<void> loadData(QuestionPaperModel questionPaper) async {
    
    loadingStatus.value = LoadingStatus.loading;

    questionPaperModel = questionPaper;
    try {

      final QuerySnapshot<Map<String,dynamic>> questionQuery = await questionPaperRF.doc(questionPaper.id).collection("questions").get();
      final questions = questionQuery.docs.map((snapshot) => Questions
              .fromSnapshot(snapshot))
              .toList();
      questionPaper.questions = questions;


      for(Questions _question in questionPaper.questions!){

        final QuerySnapshot<Map<String,dynamic>> answersQuery =  await questionPaperRF.doc(questionPaper.id)
            .collection("questions")
            .doc(_question.id)
            .collection("answers")
            .get();
        final answers =  answersQuery.docs.map((snapshot) => Answers
          .fromSnapshot(snapshot))
          .toList();
        
        _question.answers = answers;
      }

      // allQuestions.assignAll(questionPaper.questions!);
      //       if (kDebugMode) {
      //         print(questionPaper.questions![0].answers);
      //       }
      
    } catch (e) {
      if (kDebugMode) {
        print("error in qc-#...${e.toString()}..#");
      }
      loadingStatus.value = LoadingStatus.error;
    }

    if (questionPaper.questions != null && questionPaper.questions!.isNotEmpty) {
      allQuestions.assignAll(questionPaper.questions!);
      currentQuestion.value = questionPaper.questions![0];
      _startTimer(questionPaper.timeSeconds);
      if (kDebugMode) {
        print(questionPaper.questions);
        // print(currentQuestion.value!.question);
      }
      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.error;
    }

  }

  void selectedAnswer(String? answer){
    currentQuestion.value!.selectedAnswer=answer;
    update(['answers_list']);
  }


  String get completedTest{
    final answered =allQuestions.where((element) => element.selectedAnswer!=null).toList().length;
    return "$answered out of ${allQuestions.length} answered";
  }

  void jumpToQuestion(int index,{bool isGoback=true}){
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if(isGoback){
      Get.back();
    }
  }

  void complete(){
    _timer!.cancel();
    Get.offAndToNamed("/result_screen");
  }


  void nextQuestion(){
    if(questionIndex.value >= allQuestions.length-1)
      return;
    
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
    if(allQuestions[questionIndex.value].selectedAnswer==null){
      print(allQuestions[questionIndex.value].selectedAnswer);
        _timer!.cancel();
        _startTimer(questionPaperModel.timeSeconds);
    }
  }

  void prevQuestion(){
    if(questionIndex.value <= 0 )
      return;
    questionIndex.value--;
    currentQuestion.value = allQuestions[questionIndex.value];
  }


  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) { 
      if(remainSeconds==0) {
        timer.cancel();
      }
      else{
        int minutes = remainSeconds~/60;
        int sec = remainSeconds%60;
        time.value = minutes.toString().padLeft(2,"0")+":"+sec.toString().padLeft(2,"0");
        remainSeconds--;
      }
    });
  }

}