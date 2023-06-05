import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/question_controller.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/res/text_style/custom_text_style.dart';
import 'package:study_app/res/themes/app_color.dart';
import 'package:study_app/res/themes/ui_parameters.dart';
import 'package:study_app/widgets/answer_card.dart';
import 'package:study_app/widgets/background_decoration.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/countdown_timer.dart';
import 'package:study_app/widgets/custom_app_bar..dart';
import 'package:study_app/widgets/main_button.dart';
import 'package:study_app/widgets/question_place_holder.dart';

class QuestionScreen extends GetView<QuestionController> {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          // child: Obx(() => Text("Timer")),
          child: Obx(() => CountDownTimer(time: controller.time.value,color:onSurfaceTextColor,),),
          decoration: const ShapeDecoration(
            shape:StadiumBorder(
              side: BorderSide(color: onSurfaceTextColor,width: 2),
            ) 
          ),
        ),
        showActionIcon: true,
        titleWidget: Obx(() => Text("Q. ${(controller.questionIndex.value+1).toString().padLeft(2,'0')}",style: appBarText,),)
      ),
      body: BackgroundDecoration(
        child: Obx(() {
          return Column(
            children: [

              if(controller.loadingStatus.value==LoadingStatus.loading)
                const Expanded(child: ContentArea(child: QuestionScreenHolder())),
             
              if(controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(child:ContentArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Text("${controller.currentQuestion.value!.question!}",style: questionText,),

                          GetBuilder<QuestionController>(id: 'answers_list',builder: (context){
                            return ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 25),
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder:(BuildContext contex,int index){
                                final answer = controller.currentQuestion.value!.answers![index];
                                return AnswerCard(
                                  answer: '${answer.identifier}. ${answer.answer}',
                                  onTap: () {
                                    controller.selectedAnswer(answer.identifier);
                                  },
                                  isSelected: answer.identifier==controller.currentQuestion.value!.selectedAnswer,
                              );
                              } , 
                              separatorBuilder: (BuildContext contex,int index)=>const SizedBox(height: 10,), 
                              itemCount: controller.currentQuestion.value!.answers!.length
                            );
                          }),

                        ],
                      ),
                    ),
                  ) ),
              
              // if(controller.loadingStatus.value == LoadingStatus.loading)
                ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParameters.mobileScreenpadding,
                  child: Row(
                    children: [
                      Visibility(
                          visible: controller.isFirstQuestion,
                          child: SizedBox(
                            height: 55,
                            width: 55,
                            child: MainButton(
                              onTap: () {
                                controller.prevQuestion();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Get.isDarkMode
                                    ? onSurfaceTextColor
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          )),

                      Expanded(
                        child: Visibility(
                            visible: controller.loadingStatus.value==LoadingStatus.completed, 
                            child: MainButton(
                              onTap:  () {
                                controller.isLastQuestion?Get.toNamed("/test_overview_screen"):controller.nextQuestion();
                              },
                              title: controller.isLastQuestion?'Submit':'Next',
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),

                
            ],
          );
        }),
      ),
    );
  }
}