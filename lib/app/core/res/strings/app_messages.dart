class AppMessages {
  AppMessages._internal();
  static final AppMessages _instance = AppMessages._internal();
  factory AppMessages() => _instance;

  static const String sOnBoardingMessage1 =
      'Become your own money manager and make every cent count';
  static const String sOnBoardingMessage2 =
      'Track your transaction easily, with categories and financial report ';
  static const String sOnBoardingMessage3 =
      'Setup your budget for each category so you in control';
  static const String sEmailEmpty = 'Email cannot be empty';
  static const String sEmailInvalid = 'Email is invalid';
  static const String sPasswordEmpty = 'Password cannot be empty';
  static const String sPasswordInvalid =
      'Password must be at least 6 characters';
  static const String sNameEmpty = 'Name cannot be empty';
  static const String sPrivacyPolicy1 = 'By signing up, you agree to our ';
  static const String sPrivacyPolicy2 = 'Terms of Service and Privacy Policy';
  static const String sForgetPasswordMessage =
      'Don\'t worry.\nEnter your email address and we will send you a link to reset your password';
  static const String sEmailSentMessage1 = 'Your email is on the way';
  static String sEmailSentMessage2(String mail) =>
      'Check your email $mail and follow the instructions to reset your password';
}
