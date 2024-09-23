import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';

class ChipView extends StatelessWidget {
  const ChipView({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxHeight: 45,
          maxWidth: 110,
          minWidth: 110,
          minHeight: 45,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary20 : null,
          borderRadius: BorderRadius.circular(30),
          border: !isSelected
              ? Border.all(
                  color: AppColors.primary20,
                  width: 1,
                )
              : null,
        ),
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? AppColors.primary : AppColors.dark,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
