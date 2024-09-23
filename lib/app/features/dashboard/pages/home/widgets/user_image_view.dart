import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';

class UserImageView extends StatelessWidget {
  const UserImageView({super.key});
  // final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 60,
        maxWidth: 60,
        minHeight: 60,
        minWidth: 60,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary,
          width: 2,
        ),
      ),
    );
  }
}
