import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/extensiens/shimmer.dart';
import 'package:get/get.dart';

import '../../../config/app_colors.dart';

class LoadingDetail extends StatelessWidget {
  const LoadingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            height: Get.height * 0.360,
            width: Get.width,
            child: ShimmerHelper()
                .buildBasicShimmer(width: Get.width, height: Get.height)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerHelper().buildBasicShimmer(width: Get.width, height: 15),
              const SizedBox(
                height: 10,
              ),
              ShimmerHelper().buildBasicShimmer(width: Get.width, height: 50),
              const SizedBox(
                height: 15,
              ),
              ShimmerHelper().buildBasicShimmer(width: Get.width, height: 60),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              ShimmerHelper().buildBasicShimmer(width: Get.width, height: 10),
              const SizedBox(
                height: 10,
              ),
              ShimmerHelper().buildBasicShimmer(width: Get.width, height: 60),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ShimmerHelper().buildBasicShimmer(
                  width: Get.width,
                  height: 42.92,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: ShimmerHelper().buildBasicShimmer(
                  width: Get.width,
                  height: 42.92,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: ShimmerHelper().buildBasicShimmer(
            width: Get.width,
            height: 42.92,
          ),
        ),
      ],
    );
  }
}
