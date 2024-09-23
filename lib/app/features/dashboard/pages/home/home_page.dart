import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_icons.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/features/dashboard/pages/home/bloc/home_bloc.dart';
import 'package:montra/app/features/dashboard/pages/home/model/transaction_model.dart';
import 'package:montra/app/features/dashboard/pages/home/widgets/home_button_view.dart';
import 'package:montra/app/features/dashboard/pages/home/widgets/transaction_filter.dart';
import 'package:montra/app/features/dashboard/pages/home/widgets/user_image_view.dart';
import 'package:montra/app/features/dashboard/pages/transaction_history/transaction_history_page.dart';
import 'package:montra/app/features/dashboard/pages/transaction_history/widgets/transaction_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 0,
          ),
          body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const UserImageView(),
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.blue20,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
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
                                    'October',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppIcons.icNotification,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      AppHeading.hAccountBalance,
                      style: TextStyle(fontSize: 16, color: AppColors.light20),
                    ),
                    const Text(
                      '\$2,500.00',
                      style: TextStyle(
                          fontSize: 42,
                          color: AppColors.dark,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HomeButtonView(
                            title: AppHeading.hIncome,
                            color: AppColors.green,
                            icon: AppIcons.icIncome,
                            value: '\$1,500',
                            onPressed: () {},
                          ),
                          const SizedBox(width: 35),
                          HomeButtonView(
                            title: AppHeading.hTotalExpense,
                            color: AppColors.red,
                            icon: AppIcons.icExpense,
                            value: '\$1,500',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    //Transaction Filter
                    TransactionFilter(
                      onFilterChanged: (i) {
                        context.read<HomeBloc>().add(ChangeFilterIndex(i));
                      },
                      selectedIndex: state.filterIndex,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            AppHeading.hRecentTransactions,
                            style: TextStyle(
                                fontSize: 24,
                                color: AppColors.dark,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, TransactionHistoryPage.id);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: const ColoredBox(
                                color: AppColors.primary20,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 5,
                                  ),
                                  child: Text(
                                    AppHeading.hSeeAll,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (ctx, index) {
                        final transaction = list[index];
                        return TransactionView(
                          transaction: transaction,
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<TransactionModel> list = [
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
