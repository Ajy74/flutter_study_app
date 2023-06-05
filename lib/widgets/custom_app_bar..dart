import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/res/text_style/custom_text_style.dart';
import 'package:study_app/res/themes/app_icon.dart';
import 'package:study_app/res/themes/ui_parameters.dart';
import 'package:study_app/widgets/app_circle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, this.title='', this.titleWidget, this.showActionIcon=false, this.onMenuActionTap, this.leading});

  final String title;
  final Widget? titleWidget;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: mobileScreenpadding,vertical: mobileScreenpadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null?Center(
                child: Text(
                  title,style: appBarText,
                ),
              ) : Center(
                child: titleWidget,
              )
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leading??Transform.translate(
                  offset: const Offset(-14, 0),
                  child: const BackButton(),
                ),
        
                if(showActionIcon)
                  Transform.translate(
                  offset: const Offset(-10, 0),
                  child: AppCircleButton(
                    child: const Icon(AppIcons.menu),
                    onPress: onMenuActionTap??()=>Get.toNamed("/test_overview_screen"), 
                  ),
                ),
              ],
            )
          ],
        ),
      ), 
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}