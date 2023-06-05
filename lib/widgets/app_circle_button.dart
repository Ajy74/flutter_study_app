import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton({
    super.key,
    required this.child,
    this.color,
    this.onPress,
    this.width=60,
  });

  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: child,
        ),
      ),
    );
  }
}