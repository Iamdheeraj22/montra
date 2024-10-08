import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/validators.dart';
import 'package:montra/app/features/authentication/email_verification/email_verification_screen.dart';
import 'package:montra/app/features/authentication/forget_password/forget_password_screen.dart';
import 'package:montra/app/features/authentication/login/bloc/login_bloc.dart';
import 'package:montra/app/features/authentication/sign_up/sign_up_screen.dart';
import 'package:montra/app/features/dashboard/pages/dashboard_page.dart';
import 'package:montra/app/features/on_boarding/on_boarding_screen.dart';
import 'package:montra/app/reusable_widgets/button.dart';
import 'package:montra/app/reusable_widgets/edit_text.dart';
import 'package:montra/app/reusable_widgets/google_button.dart';
import 'package:montra/app/reusable_widgets/state_loading_view.dart';

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
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, DashboardPage.id, (route) => false);
          return;
        }
        if (state.status == LoginStatus.emailNotVerified) {
          Navigator.pushNamed(
            context,
            EmailVerificationScreen.id,
            arguments: emailController.text.trim().toString(),
          );
          return;
        }
      },
      builder: (context, state) {
        return StateLoadingView(
          isLoading: (state.status == LoginStatus.login ||
              state.status == LoginStatus.loginWithGoogle),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, OnBoardingScreen.id, (route) => false);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
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

                    ///Forget Password
                    Hero(
                      tag: AppHeading.hForgotPassword,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ForgetPasswordScreen.id);
                          },
                          child: const Text(
                            AppHeading.hForgotPassword,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
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
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        context.read<LoginBloc>().add(
                              LoginWithEmail(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
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
                    GoogleButton(
                      onTap: () {
                        context.read<LoginBloc>().add(LoginWithGoogle());
                      },
                      title: AppHeading.hLoginWithGoogle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: AppHeading.hDoNotHaveAccount,
                            style: TextStyle(
                                color: AppColors.light20, fontSize: 16),
                          ),
                          TextSpan(
                            text: AppHeading.hSignUp,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, SignUpScreen.id);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
