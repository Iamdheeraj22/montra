import 'package:montra/app/core/res/app_images.dart';
import 'package:montra/app/core/res/strings/app_heading.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';

class OnBoardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnBoardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

List<OnBoardingModel> onBoardings = [
  OnBoardingModel(
    title: AppHeading.hOnBoardingHeading1,
    description: AppMessages.sOnBoardingMessage1,
    imagePath: AppImages.svgOnBoarding1,
  ),
  OnBoardingModel(
    title: AppHeading.hOnBoardingHeading2,
    description: AppMessages.sOnBoardingMessage2,
    imagePath: AppImages.svgOnBoarding2,
  ),
  OnBoardingModel(
    title: AppHeading.hOnBoardingHeading3,
    description: AppMessages.sOnBoardingMessage3,
    imagePath: AppImages.svgOnBoarding3,
  ),
];
