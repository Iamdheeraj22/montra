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
}
