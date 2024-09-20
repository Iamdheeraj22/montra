import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_icons.dart';
import 'package:montra/app/core/utils/date_time_utils.dart';
import 'package:montra/app/features/home/model/transaction_model.dart';
import 'package:tuple/tuple.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key, required this.transaction});
  final TransactionModel transaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 95, maxHeight: 95),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            constraints: const BoxConstraints(
                minHeight: 60, minWidth: 60, maxHeight: 60, maxWidth: 60),
            decoration: BoxDecoration(
                color: transactionIcon(
                  transaction.transactionType,
                ).item3,
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              transactionIcon(
                transaction.transactionType,
              ).item1,
              colorFilter: ColorFilter.mode(
                transactionIcon(
                  transaction.transactionType,
                ).item2,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.dark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                transaction.description,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.light20,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '- \$ ${transaction.amount.toString()}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateTime.parse(transaction.timeStamp).time,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: AppColors.light20, fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }

  Tuple3<String, Color, Color> transactionIcon(int type) {
    switch (type) {
      case 1:
        return const Tuple3(
            AppIcons.icShopping, AppColors.yellow, AppColors.yellow20);
      case 2:
        return const Tuple3(
            AppIcons.icSubscription, AppColors.primary, AppColors.primary20);
      case 3:
        return const Tuple3(AppIcons.icFood, AppColors.red, AppColors.red20);
      default:
        return const Tuple3(
            AppIcons.icShopping, AppColors.yellow, AppColors.yellow20);
    }
  }
}
