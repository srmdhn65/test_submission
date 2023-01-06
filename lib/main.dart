import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/extensiens/font_text.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(fontFamily: FontTexts.fontRaleway),
    ),
  );
}
