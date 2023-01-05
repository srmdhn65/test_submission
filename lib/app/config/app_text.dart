import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/extensiens/font_text.dart';

import 'app_colors.dart';

class AppText extends StatelessWidget {
  final String message;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const AppText(
      {Key? key,
      required this.message,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.color,
      this.maxLines,
      this.overflow,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily ?? FontTexts.fontFamily,
        color: color ?? AppColors.textColor1,
      ),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
