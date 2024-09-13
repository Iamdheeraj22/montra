import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/core/res/app_colors.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/validators.dart';
import 'package:montra/app/features/authentication/email_verification/cubit/email_verification_cubit.dart';
import 'package:montra/app/reusable_widgets/button.dart';
import 'package:montra/app/reusable_widgets/edit_text.dart';
import 'package:montra/app/reusable_widgets/state_loading_view.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key, required this.email});
  static const String id = '/email_verification_screen';
  final String email;
  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailController.text = widget.email;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state.status == EmailVerificationStatus.success) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return StateLoadingView(
          isLoading: state.status == EmailVerificationStatus.mailSending,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                AppHeading.hEmailVerification,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    AppMessages.sEmailNotVerifiedMessage,
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                    height: 15,
                  ),
                  Button(
                    borderRadius: 16,
                    padding: const EdgeInsets.all(0),
                    text: AppHeading.hSendVerificationMail,
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      context.read<EmailVerificationCubit>().verificationEmail(
                            email: emailController.text.trim().toString(),
                          );
                    },
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
