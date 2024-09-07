import 'package:montra/app/core/res/strings/app_messages.dart';

class Validators {
  Validators._internal();
  static final Validators _instance = Validators._internal();
  factory Validators() => _instance;

  //Validate the email with regex
  static String? emailValidator(String? value) {
    if (value!.trim().isEmpty) {
      return AppMessages.sEmailEmpty;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return AppMessages.sEmailInvalid;
    }
    return null;
  }
}
