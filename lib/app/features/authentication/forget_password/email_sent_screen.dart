import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_images.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/features/authentication/login/login_screen.dart';
import 'package:montra/app/reusable_widgets/button.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key, required this.email});
  static const String id = '/email_sent_screen';
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            SvgPicture.asset(
              AppImages.svgEmailSent,
              height: 312,
              width: 312,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              AppMessages.sEmailSentMessage1,
              style: TextStyle(
                fontSize: 28,
                color: AppColors.dark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                AppMessages.sEmailSentMessage2(
                  email,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.dark,
                ),
              ),
            ),
            const Spacer(),
            Button(
              borderRadius: 16,
              padding: const EdgeInsets.all(0),
              text: AppHeading.hBackToLogin,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (route) => false);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
