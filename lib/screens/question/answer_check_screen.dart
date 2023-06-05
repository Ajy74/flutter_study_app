
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/question_controller.dart';
import 'package:study_app/res/text_style/custom_text_style.dart';
import 'package:study_app/widgets/answer_card.dart';
import 'package:study_app/widgets/background_decoration.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/custom_app_bar..dart';

class AnswerCheckScreen extends GetView<QuestionController> {
  const AnswerCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(() => Text(
          'Q. ${(controller.questionIndex.value+1).toString().padLeft(2,'0')}',
          style: appBarText,
        )),

        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed("/result_screen");
        },
      ),

      body: BackgroundDecoration(
        child:Obx(
          () => Column(
            children: [
              Expanded(
                child:ContentArea(
                  child:SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text("${controller.currentQuestion.value!.question!}",style: questionText,),

                        SizedBox(height: 10,),

                        GetBuilder<QuestionController>(
                          id: "answer_review_list",
                          builder: (_) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder:  (_,index){
                                final _answer = controller.currentQuestion.value!.answers![index];
                                final _selectedAnswer = controller.currentQuestion.value!.selectedAnswer;
                                final _correctAnswer = controller.currentQuestion.value!.correctAnswer;
                                final String _answerText = '${_answer.identifier}. ${_answer.answer}';

                                if(_correctAnswer==_selectedAnswer && _answer.identifier==_selectedAnswer){
                                  //correct answer
                                  return CorrectAnswer(answer: _answerText);
                                }
                                else if(_selectedAnswer==null){
                                  //not slected
                                  return NotAnswer(answer: _answerText);
                                }
                                else if(_correctAnswer!=_selectedAnswer && _answer.identifier==_selectedAnswer){
                                  //wrong answer
                                  return WrongAnswer(answer: _answerText);
                                } 
                                else if(_correctAnswer==_answer.identifier){
                                  //correct answer
                                  return CorrectAnswer(answer: _answerText);
                                } 

                                return AnswerCard(
                                  answer: _answerText, 
                                  onTap: () {},
                                  isSelected: false,
                                );
                              },
                              separatorBuilder: (_,index){
                                  return const SizedBox(
                                    height: 10,
                                  );
                              }, 
                              itemCount: controller.currentQuestion.value!.answers!.length
                            );
                          }
                        ),
                      ],
                    ),
                  ), 
                ),
              ),
            ],
          )
        ), 
      ),
    );
  }
}