import 'dart:async';

import 'package:flutter_tech_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var initialText = 'This is Splashscreen'.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('onReady');
    _toProductList();
  }

  @override
  void onClose() {}

  // TODO method : move to product list screen
  void _toProductList() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(Routes.PRODUCT_LIST);
    });
  }
}
