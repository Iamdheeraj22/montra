import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_icons.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/toast_message.dart';
import 'package:montra/app/reusable_widgets/button.dart';
import 'package:montra/app/reusable_widgets/chip_view.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
    this.filterBySelected,
    this.sortBySelected,
  });

  final String? filterBySelected;
  final String? sortBySelected;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> filterList = [
    AppHeading.hIncome,
    AppHeading.hTotalExpense,
    AppHeading.hTransfer
  ];

  final List<String> sortList = [
    AppHeading.hHighest,
    AppHeading.hLowest,
    AppHeading.hNewest,
    AppHeading.hOldest
  ];
  String? filterBySelected;
  String? sortBySelected;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      filterBySelected = widget.filterBySelected ?? '';
      sortBySelected = widget.sortBySelected ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          //Reset
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppHeading.hFilterTransaction,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.dark,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(
                    color: AppColors.primary20,
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  AppHeading.hReset,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            AppHeading.hFilterBy,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: filterList
                .map((e) => ChipView(
                      title: e,
                      isSelected: e.isNotEmpty && e == filterBySelected,
                      onTap: () {
                        setState(() {
                          filterBySelected = e;
                        });
                      },
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            AppHeading.hSortBy,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: sortList
                .map((e) => ChipView(
                      title: e,
                      isSelected: e.isNotEmpty && e == sortBySelected,
                      onTap: () {
                        setState(() {
                          sortBySelected = e;
                        });
                      },
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            AppHeading.hCategory,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              ToastMessage().show(message: AppMessages.mUnderDevelopment);
            },
            child: Row(
              children: [
                const Text(
                  AppHeading.hChooseCategory,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.dark,
                  ),
                ),
                const Spacer(),
                const Text(
                  '3 ${AppHeading.hSelected}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.light20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  AppIcons.icArrowRight,
                  colorFilter: const ColorFilter.mode(
                    AppColors.light20,
                    BlendMode.srcIn,
                  ),
                  height: 20,
                  width: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Button(
            text: AppHeading.hApply,
            onPressed: () {
              Navigator.pop(context, {
                'filterBy': filterBySelected,
                'sortBy': sortBySelected,
              });
            },
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
