import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';

class TransactionFilter extends StatelessWidget {
  const TransactionFilter({
    super.key,
    required this.selectedIndex,
    required this.onFilterChanged,
  });
  final int selectedIndex;
  final Function(int) onFilterChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TransactionFilterButton(
          title: AppHeading.hToday,
          isSelected: selectedIndex == 0,
          onTap: () {
            onFilterChanged(0);
          },
        ),
        TransactionFilterButton(
          title: AppHeading.hWeek,
          isSelected: selectedIndex == 1,
          onTap: () {
            onFilterChanged(1);
          },
        ),
        TransactionFilterButton(
          title: AppHeading.hMonth,
          isSelected: selectedIndex == 2,
          onTap: () {
            onFilterChanged(2);
          },
        ),
        TransactionFilterButton(
          title: AppHeading.hYear,
          isSelected: selectedIndex == 3,
          onTap: () {
            onFilterChanged(3);
          },
        ),
      ],
    );
  }
}

class TransactionFilterButton extends StatelessWidget {
  const TransactionFilterButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });
  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
            maxHeight: 35, maxWidth: 95, minWidth: 95, minHeight: 35),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.yellow20 : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.yellow : AppColors.light20,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
