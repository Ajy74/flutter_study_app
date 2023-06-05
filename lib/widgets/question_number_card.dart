import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/res/themes/app_color.dart';
import 'package:study_app/res/themes/app_dark_theme.dart';
import 'package:study_app/res/themes/ui_parameters.dart';
import 'package:study_app/widgets/answer_card.dart';

class QuestionNumberCard extends StatelessWidget {
  const QuestionNumberCard({super.key, required this.index,required this.status, required this.onTap});

  final int index;
  final AnswerStatus? status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    Color _backgroundColor = Theme.of(context).primaryColor;
    switch (status) {
      case AnswerStatus.answered:
        _backgroundColor=Get.isDarkMode?primaryColorDark.withOpacity(.6):Theme.of(context).primaryColor;
        break;
      case AnswerStatus.correct:
        _backgroundColor=correctAnswerColor;
        break;
      case AnswerStatus.wrong:
        _backgroundColor=wrongAnswerColor;
        break;
      case AnswerStatus.notanswered:
        _backgroundColor=Get.isDarkMode?cardColorDark.withOpacity(0.1):Theme.of(context).primaryColor.withOpacity(0.1);
        break;

      default:
       
        Theme.of(context).primaryColor.withOpacity(0.1);
    }

    return InkWell(
      onTap: onTap,
      borderRadius: UIParameters.cardBorderRadius,
      child: Ink(
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
              color: status==AnswerStatus.notanswered?(Get.isDarkMode?onSurfaceTextColor:Theme.of(context).primaryColor):onSurfaceTextColor
            ),  
          ),
        ),
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: UIParameters.cardBorderRadius,
        ),
      ),
    );
  }
}