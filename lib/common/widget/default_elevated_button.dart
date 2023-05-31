import 'package:flutter/material.dart';
import 'package:moa_diary_app/common/common.dart';

class DefaultElevatedButton extends StatelessWidget {
  DefaultElevatedButton({
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderRadius = 6.0,
  });

  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? mainColor,
          foregroundColor: foregroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBackgroundColor: disabledForegroundColor,
          disabledForegroundColor: disabledForegroundColor,
          elevation: 0.0,
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          child: child,
        ),
      ),
    );
  }
}
