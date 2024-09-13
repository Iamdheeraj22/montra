import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 100, maxHeight: 100),
      child: const Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
