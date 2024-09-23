import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_icons.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:montra/app/features/dashboard/pages/home/bloc/home_bloc.dart';
import 'package:montra/app/features/dashboard/pages/home/home_page.dart';
import 'package:montra/app/features/dashboard/pages/home/widgets/floating_button_item.dart';
import 'package:montra/app/features/dashboard/pages/transaction_history/transaction_history_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const String id = '/dashboard_page';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              //Home page will be shown when currentIndex is 0
              if (state.currentIndex == 0)
                BlocProvider(
                  create: (_) => HomeBloc(),
                  child: const HomePage(),
                ),
              //Transaction page will be shown when currentIndex is 1
              if (state.currentIndex == 1) const TransactionHistoryPage(),
              if (state.isMenuShow)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      if (state.isMenuShow) {
                        context.read<DashboardBloc>().add(const ShowMenu());
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
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: FloatingActionButton(
            enableFeedback: true,
            onPressed: () {
              // context.read<HomeBloc>().add(const ShowMenu());
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
                  context.read<DashboardBloc>().add(const ShowMenu());
                }
                context.read<DashboardBloc>().add(ChangeIndex(index));
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
}
