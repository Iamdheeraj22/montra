import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';

class Button extends StatelessWidget {
  final String text;
  final bool? isLoading;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;

  const Button({
    super.key,
    required this.text,
    this.isLoading,
    this.onPressed,
    this.onLongPress,
    this.color,
    this.textColor,
    this.borderRadius,
    this.fontWeight,
    this.fontSize,
    this.height = 50,
    this.width,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onPressed,
        onLongPress: onLongPress,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width ?? MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize ?? 18,
            ),
          ),
        ),
      ),
    );
  }
}
