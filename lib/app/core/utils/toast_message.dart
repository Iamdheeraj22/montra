import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:montra/app/core/res/app_colors.dart';

class ToastMessage {
  ToastMessage._internal();
  static final ToastMessage _instance = ToastMessage._internal();
  factory ToastMessage() => _instance;

  void show({required String message}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: AppColors.primary,
      fontSize: 16.0,
    );
  }
}
