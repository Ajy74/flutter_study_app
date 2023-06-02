import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/res/text_style/custom_text_style.dart';
import 'package:study_app/res/themes/ui_parameters.dart';

import '../res/themes/app_icon.dart';
import 'app_icon_text.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      child: SizedBox(
                        height: Get.width*0.15,
                        width: Get.width*0.15,
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ) ,
                          imageUrl: model.imageUrl!,
                          errorWidget: (context, url, error) => Image.asset("assets/images/app_splash_logo.png"),
                        ),
                      ),
                    ),
                  ),
                
                SizedBox(width: 12,),
    
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(model.title,
                          style: cardTitles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 15),
                          child: Text(model.description),
                        ),
    
                        Row(
                          children: [
                            AppIconText(
                              icon: Icon(Icons.help_outline_sharp,
                                color:Get.isDarkMode?Colors.white:Theme.of(context).primaryColor
                               ),
                              text: Text('${model.questionCount} questions',
                                  style: detailedText.copyWith(
                                    color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor
                                  ),
                              ),
                            ),
                            
                            SizedBox(width: 15,),
    
                            AppIconText(
                              icon: Icon(Icons.timer,
                                color:Get.isDarkMode?Colors.white:Theme.of(context).primaryColor
                               ),
                              text: Text('${model.timeInMinits()}',
                                  style: detailedText.copyWith(
                                    color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor
                                  ),
                              ),
                            ),
    
                          ],
                        ),
                    ],
                  ),
                )
    
              ],
            ),
            Positioned(
              bottom: -10.0,
              right: -10.0,
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                  child: Icon(AppIcons.trophyOutline),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(cardBorderRadius),bottomRight: Radius.circular(cardBorderRadius)),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}