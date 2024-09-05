import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _instance = AppColors._internal();
  factory AppColors() => _instance;
  AppColors._internal();

  // Primary
  static const Color primary = Color(0xFF7F3DFF);
  static const Color primary80 = Color(0xFF8F57FF);
  static const Color primary60 = Color(0xFFA17DFF);
  static const Color primary40 = Color(0xFFC4B0FF);
  static const Color primary20 = Color(0xFFEEE5FF);

  //Light
  static const Color light = Color(0xFFFFFFFF);
  static const Color light80 = Color(0xFFFCFCFC);
  static const Color light60 = Color(0xFFF1F1FA);
  static const Color light40 = Color(0xFFE3E5E5);
  static const Color light20 = Color(0xFF91919F);

  //Dark
  static const Color dark = Color(0xFF000000);
  static const Color dark75 = Color(0xFF161719);
  static const Color dark50 = Color(0xFF212325);
  static const Color dark25 = Color(0xFF292B2D);

  //Blue
  static const Color blue = Color(0xFF0077FF);
  static const Color blue80 = Color(0xFF248AFF);
  static const Color blue60 = Color(0xFF57A5FF);
  static const Color blue40 = Color(0xFF8AC0FF);
  static const Color blue20 = Color(0xFFBDDCFF);

  //Red
  static const Color red = Color(0xFFFD3C4A);
  static const Color red80 = Color(0xFFFD5662);
  static const Color red60 = Color(0xFFFD6F7A);
  static const Color red40 = Color(0xFFFDA2A9);
  static const Color red20 = Color(0xFFFDD5D7);

  //Green
  static const Color green = Color(0xFF00A86B);
  static const Color green80 = Color(0xFF2AB784);
  static const Color green60 = Color(0xFF65D1AA);
  static const Color green40 = Color(0xFF93EACA);
  static const Color green20 = Color(0xFFCFFAEA);

  //Yellow
  static const Color yellow = Color(0xFFFCAC12);
  static const Color yellow80 = Color(0xFFFCBB3C);
  static const Color yellow60 = Color(0xFFFCCC6F);
  static const Color yellow40 = Color(0xFFFCDDA1);
  static const Color yellow20 = Color(0xFFFCEED4);
}
