import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/toast_message.dart';
import 'package:montra/app/core/utils/validators.dart';
import 'package:montra/app/features/authentication/authentication_service/authentication_service.dart';
import 'package:montra/app/features/authentication/email_verification/email_verification_screen.dart';
import 'package:montra/app/features/authentication/login/login_screen.dart';
import 'package:montra/app/features/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:montra/app/reusable_widgets/button.dart';
import 'package:montra/app/reusable_widgets/edit_text.dart';
import 'package:montra/app/reusable_widgets/google_button.dart';
import 'package:montra/app/reusable_widgets/state_loading_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String id = '/sign_up_screen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status == SignUpStatus.success) {
          Navigator.pushReplacementNamed(
            context,
            EmailVerificationScreen.id,
            arguments: emailController.text.trim().toString(),
          );
          return;
        }
        if (state.googleStatus == SignUpStatus.success) {
          Navigator.pushReplacementNamed(
            context,
            EmailVerificationScreen.id,
            arguments: state.email,
          );
          AuthenticationService().signOut();
          return;
        }
      },
      builder: (context, state) {
        return StateLoadingView(
          isLoading: (state.status == SignUpStatus.registering ||
              state.googleStatus == SignUpStatus.googleRegistration),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                AppHeading.hSignUp,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      EditText(
                        hintText: AppHeading.hName,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return AppMessages.sNameEmpty;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
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
                          if (v.length < 6) {
                            return AppMessages.sPasswordInvalid;
                          }
                          return null;
                        },
                        suffix: IconButton(
                          onPressed: () {
                            context
                                .read<SignUpBloc>()
                                .add(const SignUpPasswordVisibilityChanged());
                          },
                          icon: Icon(
                            state.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.dark25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: state.isAgree,
                            onChanged: (v) {
                              context
                                  .read<SignUpBloc>()
                                  .add(const SignUpAgreeChanged());
                            },
                            focusColor: AppColors.primary,
                          ),
                          Expanded(
                            child: RichText(
                                text: const TextSpan(
                              text: AppMessages.sPrivacyPolicy1,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: AppMessages.sPrivacyPolicy2,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Button(
                        borderRadius: 16,
                        padding: const EdgeInsets.all(0),
                        text: AppHeading.hSignUp,
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          if (!state.isAgree) {
                            ToastMessage().show(
                              message: AppMessages.sPrivacyPolicyAgree,
                            );
                            return;
                          }
                          context.read<SignUpBloc>().add(
                                Registration(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  name: nameController.text.trim(),
                                  userType: 1,
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
                          context.read<SignUpBloc>().add(
                                const RegistrationWithGoogle(),
                              );
                        },
                        title: AppHeading.hSignUpWithGoogle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: AppHeading.hAlreadyHaveAnAccount,
                              style: TextStyle(
                                  color: AppColors.light20, fontSize: 16),
                            ),
                            TextSpan(
                              text: AppHeading.hLogin,
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      LoginScreen.id, (route) => false);
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
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
