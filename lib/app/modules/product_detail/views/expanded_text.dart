import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tech_test/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:get/get.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  var controller = Get.find<ProductDetailController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AnimatedSize(
                vsync: this,
                duration: const Duration(milliseconds: 500),
                child: ConstrainedBox(
                    constraints: controller.showMore
                        ? const BoxConstraints()
                        : const BoxConstraints(maxHeight: 50.0),
                    child: Html(
                      data: widget.text,
                      style: {'p': Style(textAlign: TextAlign.justify)},
                    ))),
            TextButton(
                child: AppText(
                  message:
                      controller.showMore ? "Lihat Sedikit" : "Lihat Semua",
                  color: AppColors.textColor3,
                ),
                onPressed: () {
                  controller.onSeeMoreDescription;
                })
          ]),
    );
  }
}
