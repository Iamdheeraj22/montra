class AppImages {
  static final AppImages _instance = AppImages._internal();
  factory AppImages() => _instance;
  AppImages._internal();

  static const String path = 'assets/images/';

  static const String svgOnBoarding1 = '${path}on_boarding_1.svg';
  static const String svgOnBoarding2 = '${path}on_boarding_2.svg';
  static const String svgOnBoarding3 = '${path}on_boarding_3.svg';
  static const String svgGoogle = '${path}google.svg';
  static const String svgEmailSent = '${path}email_sent.svg';
}
