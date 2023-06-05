import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/res/themes/app_color.dart';
import 'package:study_app/res/themes/app_dark_theme.dart';
import 'package:study_app/res/themes/app_light_theme.dart';
import 'package:study_app/res/themes/ui_parameters.dart';

enum AnswerStatus{
  correct,wrong,answered,notanswered
}

class AnswerCard extends StatelessWidget {

  const AnswerCard({super.key, required this.answer,  this.isSelected = false, required this.onTap});

  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: UIParameters.cardBorderRadius,
      child: Ink(
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected?onSurfaceTextColor:null,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: isSelected?answerSelectedColor():(Get.isDarkMode?primaryColorDark.withOpacity(.6):Theme.of(context).cardColor),
          border: Border.all(
            color: isSelected?answerSelectedColor():answerBorderColor()
          )
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key, required this.answer});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: correctAnswerColor.withOpacity(0.1),
      ),
      child: Text(
        answer,
        style: TextStyle(
          color: correctAnswerColor,fontWeight: FontWeight.bold
        ),
      ),
    ) ;
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({super.key, required this.answer});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: wrongAnswerColor.withOpacity(0.1),
      ),
      child: Text(
        answer,
        style: TextStyle(
          color: wrongAnswerColor,fontWeight: FontWeight.bold
        ),
      ),
    ) ;
  }
}

class NotAnswer extends StatelessWidget {
  const NotAnswer({super.key, required this.answer});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Get.isDarkMode?cardColorDark.withOpacity(.1):notAnsweredColor.withOpacity(0.1),
      ),
      child: Text(
        answer,
        style: TextStyle(
          color:  Get.isDarkMode?onSurfaceTextColor:notAnsweredColor,fontWeight: FontWeight.bold
        ),
      ),
    ) ;
  }
}
