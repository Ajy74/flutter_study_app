import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/res/themes/app_color.dart';
import 'package:study_app/res/themes/app_dark_theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key,  this.title='', required this.onTap, this.enabled=true, this.child, this.color});

  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 50,
        child: InkWell(
          onTap: enabled==false?null:onTap,
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color??(Get.isDarkMode?primaryColorDark.withOpacity(.6):Theme.of(context).cardColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child??Center(
                child: Text(title,style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode?onSurfaceTextColor:Theme.of(context).primaryColor
              ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}