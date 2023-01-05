import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/config/app_colors.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          controller.initialText.value,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
