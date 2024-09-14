import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/user_state/user_state_bloc.dart';
import 'package:montra/app/features/home/home_page.dart';
import 'package:montra/app/features/on_boarding/on_boarding_screen.dart';
import 'package:montra/app/storage/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final storage = StorageService.getInstance();
      final isLogin = await storage.isLogin;
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (isLogin ?? false) {
            context.read<UserStateBloc>().add(GetUserDetails());
            Navigator.pushReplacementNamed(context, HomePage.id);
            return;
          }
          Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
          return;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 47,
              width: 50,
              constraints: const BoxConstraints(
                maxHeight: 47,
                maxWidth: 50,
              ),
              margin: const EdgeInsets.only(top: 15, left: 35),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFEF5DA8).withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFEF5DA8).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
            const Text(
              'Montra',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
