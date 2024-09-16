import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_icons.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/features/home/bloc/home_bloc.dart';
import 'package:montra/app/features/home/widgets/floating_button_item.dart';

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
            onPressed: () {
              context.read<HomeBloc>().add(const ShowMenu());
            },
            backgroundColor: AppColors.primary,
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
          bottomNavigationBar: BottomNavigationBar(
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
        );
      },
    );
  }
}
