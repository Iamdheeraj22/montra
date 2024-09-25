import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/reusable_widgets/button.dart';
import 'package:montra/app/reusable_widgets/edit_text.dart';

class AmountBottomSheet extends StatelessWidget {
  AmountBottomSheet({super.key});
  final TextEditingController amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppHeading.hAmount,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: formKey,
            child: EditText(
              keyboardType: TextInputType.number,
              controller: amountController,
              hintText: AppMessages.mEnterAmount,
              inputFormatters: [
                //allow only number
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                final double amount = double.tryParse(value ?? '0') ?? 0;
                if (value == null || value.trim().isEmpty) {
                  return AppMessages.mEnterAmount;
                }
                if (amount <= 0) {
                  return AppMessages.sAmountLessThanZero;
                }
                return null;
              },
            ),
          ),
          Button(
            text: AppHeading.hContinue,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.of(context)
                    .pop(double.tryParse(amountController.text.trim()));
              }
            },
            padding: const EdgeInsets.symmetric(vertical: 15),
          )
        ],
      ),
    );
  }
}
