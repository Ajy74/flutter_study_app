import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/question_controller_extension.dart';
import 'package:study_app/res/text_style/custom_text_style.dart';
import 'package:study_app/res/themes/app_light_theme.dart';
import 'package:study_app/res/themes/ui_parameters.dart';
import 'package:study_app/widgets/answer_card.dart';
import 'package:study_app/widgets/background_decoration.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/custom_app_bar..dart';
import 'package:study_app/widgets/main_button.dart';
import 'package:study_app/widgets/question_number_card.dart';

import '../../controllers/question_paper/question_controller.dart';
import '../../res/themes/app_dark_theme.dart';

class ResultScreen extends GetView<QuestionController> {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Color _textColor = Get.isDarkMode?Colors.white:Theme.of(context).primaryColor;

    return Scaffold(
      appBar:  CustomAppBar(
              leading: const SizedBox(height: 80,),
              title: controller.correctAnsweredQuestion,
            ),
      extendBodyBehindAppBar: true,
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child:ContentArea(
                child:Column(
                  children: [
                    SvgPicture.asset('assets/images/bulb.svg' ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 5),
                      child: Text("Congratulations",
                        style: headerText.copyWith(color: _textColor),
                      ),
                    ),

                   Text('you have ${controller.points} points',style: TextStyle(color: _textColor)),

                    const SizedBox(height: 25,),

                    const Text("Tap below question numbers to view correct answers",textAlign: TextAlign.center,),

                    const SizedBox(height: 25,),

                    Expanded(
                      child: GridView.builder(
                      itemCount: controller.allQuestions.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width~/75,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ), 
                      itemBuilder: (_,index){
                        final _question = controller.allQuestions[index];
                        AnswerStatus _status =AnswerStatus.notanswered;
                        final _selectedAnswer= _question.selectedAnswer;
                        final _correctAnswer = _question.correctAnswer;
                        if(_selectedAnswer==_correctAnswer){
                          _status = AnswerStatus.correct;
                        }
                        else if(_selectedAnswer==null){
                          _status = AnswerStatus.wrong;
                        }
                        else{
                           _status = AnswerStatus.wrong;
                        }

                        return QuestionNumberCard(
                          index: index+1,
                          status: _status, 
                          onTap: () {
                            controller.jumpToQuestion(index,isGoback: false);
                            Get.toNamed('/answer_check_screen');
                          },
                        );
                      }),
                    ),
                  ],
                ), 
              ), 
            ),
            
            ColoredBox(
              color: Get.isDarkMode?primaryDarkColordark:Color.fromARGB(255, 240, 237, 255),
              child: Padding(
                padding:UIParameters.mobileScreenpadding,
                child: Row(children: [
                  Expanded(
                    child: MainButton(
                      onTap: ()=>controller.tryAgain() ,
                      color: Get.isDarkMode?primaryColorDark.withOpacity(.1):primaryColorLight.withOpacity(.1),
                      title: 'Try again', 
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: MainButton(
                      onTap: ()=>controller.saveTestResult() ,
                      color: Get.isDarkMode?cardColorDark.withOpacity(.1):cardColorLight,
                      title: 'Go home', 
                    ),
                  ),
                ],), 
              ),
            ),

          ],
        )
      ),
    );
  }
}