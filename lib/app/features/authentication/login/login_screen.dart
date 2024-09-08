import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/app_images.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/validators.dart';
import 'package:montra/app/features/authentication/login/bloc/login_bloc.dart';
import 'package:montra/app/reusable_widgets/button.dart';
import 'package:montra/app/reusable_widgets/edit_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = '/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              AppHeading.hLogin,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  EditText(
                    hintText: AppHeading.hEmail,
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.emailValidator,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EditText(
                    hintText: AppHeading.hPassword,
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    obscureText: state.isPasswordVisible,
                    keyboardType: TextInputType.text,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return AppMessages.sPasswordEmpty;
                      }
                      return null;
                    },
                    suffix: IconButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(PasswordVisibility());
                      },
                      icon: Icon(
                        state.isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.dark25,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        AppHeading.hForgotPassword,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Button(
                    borderRadius: 16,
                    padding: const EdgeInsets.all(0),
                    text: AppHeading.hLogin,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    AppHeading.hOrWith,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.light20,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      constraints: const BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: 50,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.svgGoogle,
                            height: 32,
                            width: 32,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            AppHeading.hSignUpWithGoogle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.dark,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: AppHeading.hDoNotHaveAccount,
                          style:
                              TextStyle(color: AppColors.light20, fontSize: 16),
                        ),
                        TextSpan(
                          text: AppHeading.hSignUp,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}