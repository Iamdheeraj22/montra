import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/features/authentication/sign_up/sign_up_screen.dart';
import 'package:montra/app/features/on_boarding/model/on_boarding_model.dart';
import 'package:montra/app/features/on_boarding/widgets/on_boarding_item.dart';
import 'package:montra/app/reusable_widgets/button.dart';

import '../authentication/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String id = '/on_boarding_screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int focusedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 510,
                maxWidth: 277,
              ),
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (i) {
                  setState(() {
                    focusedIndex = i;
                  });
                },
                itemBuilder: (ctx, i) {
                  final data = onBoardings[i];
                  return OnBoardingItem(
                    title: data.title,
                    description: data.description,
                    imagePath: data.imagePath,
                  );
                },
                itemCount: onBoardings.length,
              ),
            ),
            SizedBox(
              height: 20,
              child: ListView.builder(
                  itemCount: onBoardings.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) {
                    final isFocused = focusedIndex == i;
                    return Container(
                      width: isFocused ? 20 : 12,
                      height: isFocused ? 20 : 12,
                      constraints: const BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 20,
                      ),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color:
                            isFocused ? AppColors.primary : AppColors.light40,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              text: AppHeading.hSignUp,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.id);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              color: AppColors.light40,
              text: AppHeading.hLogin,
              textColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
