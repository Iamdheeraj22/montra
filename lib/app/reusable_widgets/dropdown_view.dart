import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';

class DropdownView extends StatelessWidget {
  const DropdownView({
    super.key,
    required this.items,
    required this.hintText,
    this.value,
    this.onChanged,
    this.onTap,
  });
  final List<String> items;
  final String hintText;
  final String? value;
  final void Function(String?)? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: Text(hintText),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.light60),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.light60),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.light60),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.light60),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.light60),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColors.light60),
        ),
      ),
      items: items
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: onChanged,
      value: items.isEmpty ? null : items[0],
      onTap: onTap,
    );
  }
}
