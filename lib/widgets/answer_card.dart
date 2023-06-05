import 'package:flutter/material.dart';
import 'package:study_app/res/themes/app_color.dart';
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
          color: isSelected?answerSelectedColor():Theme.of(context).cardColor,
          border: Border.all(
            color: isSelected?answerSelectedColor():answerBorderColor()
          )
        ),
      ),
    );
  }
}