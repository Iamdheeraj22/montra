import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_icons.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/features/home/bloc/home_bloc.dart';
import 'package:montra/app/features/home/model/transaction_model.dart';
import 'package:montra/app/features/home/widgets/floating_button_item.dart';
import 'package:montra/app/features/home/widgets/home_button_view.dart';
import 'package:montra/app/features/home/widgets/transaction_filter.dart';
import 'package:montra/app/features/home/widgets/user_image_view.dart';
import 'package:montra/app/features/transaction_history/transaction_history_page.dart';
import 'package:montra/app/features/transaction_history/transaction_view.dart';

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
                if (state.isMenuShow)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        if (state.isMenuShow) {
                          context.read<HomeBloc>().add(const ShowMenu());
                        }
                      },
                      child: AnimatedContainer(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        duration: const Duration(milliseconds: 1500),
                        decoration: BoxDecoration(
                          //grey transparent background
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Column(
                          //  mainAxisSize: MainAxisSize.min,
                          children: [
                            const Spacer(),
                            FloatingButtonItem(
                              icon: AppIcons.icTransfer,
                              color: AppColors.blue,
                              onPressed: () {},
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingButtonItem(
                                  icon: AppIcons.icIncome,
                                  color: AppColors.green,
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 100),
                                FloatingButtonItem(
                                  icon: AppIcons.icExpense,
                                  color: AppColors.red,
                                  onPressed: () {},
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: FloatingActionButton(
            enableFeedback: true,
            onPressed: () {
              context.read<HomeBloc>().add(const ShowMenu());
            },
            backgroundColor: AppColors.primary,
            isExtended: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              state.isMenuShow ? Icons.close : Icons.add,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: 5.0,
            padding: EdgeInsets.zero,
            shape: const CircularNotchedRectangle(),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                if (state.isMenuShow) {
                  context.read<HomeBloc>().add(const ShowMenu());
                }
                context.read<HomeBloc>().add(ChangeIndex(index));
              },
              currentIndex: state.currentIndex,
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.icHome,
                    colorFilter: ColorFilter.mode(
                        state.currentIndex == 0
                            ? AppColors.primary
                            : AppColors.light20,
                        BlendMode.srcIn),
                  ),
                  label: AppHeading.hHome,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.icTransaction,
                    colorFilter: ColorFilter.mode(
                        state.currentIndex == 1
                            ? AppColors.primary
                            : AppColors.light20,
                        BlendMode.srcIn),
                  ),
                  label: AppHeading.hTransactions,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.icBudget,
                    colorFilter: ColorFilter.mode(
                        state.currentIndex == 2
                            ? AppColors.primary
                            : AppColors.light20,
                        BlendMode.srcIn),
                  ),
                  label: AppHeading.hBudget,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.icUser,
                    colorFilter: ColorFilter.mode(
                        state.currentIndex == 3
                            ? AppColors.primary
                            : AppColors.light20,
                        BlendMode.srcIn),
                  ),
                  label: AppHeading.hProfile,
                ),
              ],
              selectedLabelStyle: const TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelStyle: const TextStyle(
                color: AppColors.dark,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
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
