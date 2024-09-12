import 'package:flutter/material.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/validators.dart';
import 'package:montra/app/features/authentication/forget_password/email_sent_screen.dart';
import 'package:montra/app/reusable_widgets/button.dart';
import 'package:montra/app/reusable_widgets/edit_text.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const String id = '/forget_password_screen';
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Hero(
          tag: AppHeading.hForgotPassword,
          child: Text(
            'Forget Password',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                AppMessages.sForgetPasswordMessage,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.dark),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: EditText(
                  hintText: AppHeading.hEmail,
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.emailValidator,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                borderRadius: 16,
                padding: const EdgeInsets.all(0),
                text: AppHeading.hContinue,
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  Navigator.pushNamed(
                    context,
                    EmailSentScreen.id,
                    arguments: emailController.text.trim(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
