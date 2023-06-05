import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/question_controller.dart';
import 'package:study_app/res/text_style/custom_text_style.dart';
import 'package:study_app/res/themes/ui_parameters.dart';
import 'package:study_app/widgets/answer_card.dart';
import 'package:study_app/widgets/background_decoration.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/countdown_timer.dart';
import 'package:study_app/widgets/custom_app_bar..dart';
import 'package:study_app/widgets/main_button.dart';
import 'package:study_app/widgets/question_number_card.dart';

import '../../res/themes/app_dark_theme.dart';

class TestOverviewScreen extends GetView<QuestionController> {
  const TestOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body:BackgroundDecoration(
       child: Column(children: [
        Expanded(
          child: ContentArea(
            child: Column(
              children: [
                Row(
                  children: [
                    CountDownTimer(
                      color: UIParameters.isDarkMode()
                          ? Theme.of(context).textTheme.bodyLarge!.color
                          : Theme.of(context).primaryColor,
                      time: "",
                    ),
                    Obx(() => Text(
                          '${controller.time} Remaining',
                          style: countDownTimerTs(),
                        )),
                  ],
                ),

                const SizedBox(height: 20,),

                Expanded(child:
                    GridView.builder(
                    itemCount: controller.allQuestions.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/75,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ), 
                    itemBuilder: (_,index){
                      AnswerStatus? _answerStatus;
                      if(controller.allQuestions[index].selectedAnswer!=null){
                        _answerStatus = AnswerStatus.answered;
                      }
                      if(controller.allQuestions[index].selectedAnswer==null){
                        _answerStatus = AnswerStatus.notanswered;
                      }
                      return QuestionNumberCard(
                        index: index+1, 
                        status: _answerStatus, 
                        onTap: () {
                          controller.jumpToQuestion(index);
                        },
                      ) ;
                    }
                  ),
                ),

              ],
            ),
          ),
        ),

        ColoredBox(
          color:Get.isDarkMode?primaryDarkColordark:Color.fromARGB(255, 240, 237, 255),
          child: Padding(
            padding:UIParameters.mobileScreenpadding,
            child: MainButton(
              onTap:() {
                controller.complete();
              },
              title: "Complete", 
            ), 
          ),
        ),
       ],),
      ),
    );
  }
}