import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  // late String id;
  // late String title;
  // late String? imageUrl;
  // late String description;
  // late int timeSeconds;
  // late List<Questions>? questions;

  // late int questionCount;
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;

  int questionCount;

  // @override
  // String toString() {
  //   return 'QuestionPaperModel(id: $id, title: $title, imageUrl: $imageUrl, description: $description, timeSeconds: $timeSeconds, questionCount: $questionCount, questions: $questions)';
  // }


  QuestionPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      this.questions,
      required this.questionCount});

  QuestionPaperModel.fromJson(Map<String, dynamic> json) :
    id = json['id'] as String,
    title = json['title'] as String ,
    imageUrl = json['image_url'] as String ,
    description = json['Description'] as String,
    timeSeconds = json['time_seconds'] ,
    questionCount=0,
    questions = (json['questions'] as List).map((dynamic e) => Questions.fromJson(e as Map<String,dynamic>)).toList();

//this is for getting data from firestore
  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> json) :
    id = json.id ,
    title = json['title'] ,
    imageUrl = json['image_url'] ,
    description = json['Description'] ,
    timeSeconds = json['time_seconds'] ,
    questionCount=json['questions_count'] as int,
    questions = [];
    //   final data = json.data();
    //   id = json.id;
    //   title = data?['title'] ?? '';
    //   imageUrl = data?['image_url']??'';
    //   description = data?['Description'] ?? '';
    //   timeSeconds = data?['time_seconds'] ?? 0;
    //   questionCount = data?['questions_count'] ?? 0;
    //   questions = [];
    // }
//this is for getting data from firestore

String timeInMinits()=> "${(timeSeconds / 60).ceil()} mins";
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['Description'] = this.description;
    data['time_seconds'] = this.timeSeconds;
    // if (this.questions != null) {
    //   data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Questions {
  String? id;
  String? question;
  List<Answers>? answers;
  String? correctAnswer;

  Questions({this.id, this.question, this.answers, this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    question = json['question'],
    answers = (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
    correctAnswer = json['correct_answer'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json) :
    identifier = json['identifier'],
    answer = json['Answer'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['Answer'] = this.answer;
    return data;
  }
}