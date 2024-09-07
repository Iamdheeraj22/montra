import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';

class EditText extends StatelessWidget {
  const EditText({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onFieldSubmitted,
    this.obscureText,
    this.prefix,
    this.suffix,
    this.contentPadding,
    this.enabled,
  });
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String Function(String)? onFieldSubmitted;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  final bool? obscureText;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      enabled: enabled ?? true,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 20,
          top: 10,
          bottom: 10,
        ),
        constraints: BoxConstraints(
          maxHeight: 70,
          maxWidth: MediaQuery.sizeOf(context).width,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.light60,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.light60,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.light60,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.light60,
          ),
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
