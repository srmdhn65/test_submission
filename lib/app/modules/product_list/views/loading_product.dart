import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/extensiens/shimmer.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text.dart';
import '../../../extensiens/font_text.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightGrey)),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: ShimmerHelper().buildBasicShimmer(
                      width: 102.19,
                      height: 150,
                    )),
                const SizedBox(
                  height: 5,
                ),
                ShimmerHelper().buildBasicShimmer(
                  width: Get.width,
                  height: 12,
                ),
                const SizedBox(
                  height: 5,
                ),
                ShimmerHelper().buildBasicShimmer(
                  width: Get.width,
                  height: 10,
                ),
                const SizedBox(
                  height: 5,
                ),
                ShimmerHelper().buildBasicShimmer(
                  width: Get.width,
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
