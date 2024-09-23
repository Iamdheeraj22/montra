import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_icons.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/utils/date_time_utils.dart';
import 'package:montra/app/features/dashboard/pages/home/model/transaction_model.dart';
import 'package:montra/app/features/dashboard/pages/transaction_history/widgets/filter_bottomsheet.dart';
import 'package:montra/app/features/dashboard/pages/transaction_history/widgets/transaction_view.dart';
import 'package:montra/app/reusable_widgets/chip_view.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});
  static const String id = '/transaction_history_page';
  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.blue20,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    AppIcons.icArrowDown,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  AppHeading.hMonth,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final result = showModalBottomSheet(
                context: context,
                useSafeArea: true,
                showDragHandle: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (context) => FilterBottomSheet(),
              );
            },
            icon: SvgPicture.asset(
              AppIcons.icFilter,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                ChipView(
                  onTap: () {},
                  isSelected: false,
                  title: 'Title',
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppHeading.hSeeYourFinancialReport,
                          style: TextStyle(fontSize: 16),
                        ),
                        SvgPicture.asset(
                          AppIcons.icArrowRight,
                          height: 32,
                          width: 32,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GroupedListView<TransactionModel, DateTime>(
                    elements: list,
                    groupBy: (element) => DateTime.parse(element.timeStamp),
                    groupSeparatorBuilder: (DateTime value) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value.isToday
                            ? AppHeading.hToday
                            : value.isYesterday
                                ? AppHeading.hYesterday
                                : DateFormat("dd MMM yyyy").format(value),
                        //textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    itemBuilder: (context, TransactionModel element) =>
                        TransactionView(
                      transaction: element,
                    ),

                    // useStickyGroupSeparators: true, // optional
                    floatingHeader: true, // optional
                    order: GroupedListOrder.ASC, // optional
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<TransactionModel> list = [
    const TransactionModel(
      '4564654',
      title: 'Title 1',
      description: 'Description 1',
      amount: 10,
      timeStamp: '2020-06-16T10:31:12.000Z',
      transactionType: 1,
    ),
    const TransactionModel(
      '4564654',
      title: 'Title 2',
      description: 'Description 2',
      amount: 20,
      timeStamp: '2020-06-16T10:31:12.000Z',
      transactionType: 2,
    ),
    const TransactionModel(
      '4564654',
      title: 'Title 3',
      description: 'Description 3',
      amount: 30,
      timeStamp: '2020-06-17T10:31:12.000Z',
      transactionType: 1,
    ),
    const TransactionModel(
      '4564654',
      title: 'Title 4',
      description: 'Description 4',
      amount: 40,
      timeStamp: '2020-06-17T10:31:12.000Z',
      transactionType: 2,
    ),
    const TransactionModel(
      '4564654',
      title: 'Title 5',
      description: 'Description 5',
      amount: 50,
      timeStamp: '2020-06-18T10:31:12.000Z',
      transactionType: 1,
    ),
    const TransactionModel(
      '4564654',
      title: 'Title 6',
      description: 'Description 6',
      amount: 60,
      timeStamp: '2020-06-18T10:31:12.000Z',
      transactionType: 2,
    ),
    const TransactionModel(
      '4564654',
      title: 'Title 7',
      description: 'Description 7',
      amount: 70,
      timeStamp: '2020-06-19T10:31:12.000Z',
      transactionType: 1,
    ),
    const TransactionModel(
      '4564654',
      title: 'Title 8',
      description: 'Description 8',
      amount: 80,
      timeStamp: '2020-06-19T10:31:12.000Z',
      transactionType: 2,
    ),
  ];
}
