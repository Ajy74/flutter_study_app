import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/res/text_style/custom_text_style.dart';
import 'package:study_app/res/themes/app_color.dart';
import 'package:study_app/res/themes/app_icon.dart';
import 'package:study_app/res/themes/ui_parameters.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/question_card.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuestionPaperController questionPaperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        menuScreen: Text("hi there",style: TextStyle(color: Colors.red),),
        mainScreen: Container(
          decoration: BoxDecoration(
            gradient: Get.isDarkMode?mainGradientDark:mainGradientLight
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(mobileScreenpadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       AppCircleButton(child: Icon(AppIcons.menuLeft,),
                       onPress: null,),....
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            Icon(AppIcons.peace),
                            SizedBox(width: 10,),
                            Text(
                              "Hellow friends",
                              style: detailedText.copyWith(
                                color: onSurfaceTextColor
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "What Do You Want To Learn Today ?",style: headerText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(() {
                        return  ListView.separated(
                          padding: UIParameters.mobileScreenpadding,
                          itemCount: questionPaperController.allPapers.length,
                          itemBuilder:(BuildContext context,int  index) {
                              return QuestionCard(model: questionPaperController.allPapers[index] );
                          } ,
                          separatorBuilder: (BuildContext context,int  index) {
                              return const SizedBox(height: 20,);
                          },
                        ) ;
                      }),
                    ),
                  ),
                ),
                
              ],
            ),
          )
           ),
         
      )
    );
  }
}