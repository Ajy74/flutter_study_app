import 'package:flutter/material.dart';
import 'package:study_app/res/themes/app_color.dart';

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
              color: color??Theme.of(context).cardColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child??Center(
                child: Text(title,style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: onSurfaceTextColor
              ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}