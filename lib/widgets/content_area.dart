import 'package:flutter/material.dart';
import 'package:study_app/res/themes/app_color.dart';
import 'package:study_app/res/themes/ui_parameters.dart';

class ContentArea extends StatelessWidget {

  final bool addPadding;
  final Widget child;

  const ContentArea({super.key, this.addPadding=true, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: customScafoldColor(context)
        ),
        padding: addPadding?EdgeInsets.only(top: mobileScreenpadding,left: mobileScreenpadding,right: mobileScreenpadding):EdgeInsets.zero,

        child: child,
      ),
    );
  }
}