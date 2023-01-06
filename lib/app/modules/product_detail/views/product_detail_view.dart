import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_tech_test/app/config/app_colors.dart';
import 'package:flutter_tech_test/app/config/app_text.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.textColor1,
            )),
        title: const AppText(
          message: 'Gift Detail',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.360,
                      width: Get.width,
                      child: Stack(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(17.5),
                              child: controller.productDetail.images == null
                                  ? Image.asset(
                                      "assets/images/img_produk_2@2x.png",
                                      fit: BoxFit.contain,
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(
                                          controller
                                              .productDetail.images!.first,
                                        ),
                                      )),
                                    )),
                          controller.productDetail.isNew == 1
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    "assets/images/ic_new@2x.png",
                                    height: 45,
                                    width: 45,
                                  ))
                              : const SizedBox()
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            message: controller.productDetail.name ?? "title",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Html(
                            data: controller.productDetail.description,
                            style: {'p': Style(textAlign: TextAlign.justify)},
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: AppColors.lightGrey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          sectionCenter(),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: AppColors.lightGrey,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppText(
                            message: "Info Produk",
                            fontSize: 14,
                            color: AppColors.textColor1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: controller.expandedInfo
                                  ? Get.height * 0.12
                                  : Get.height * 0.04,
                              child: Html(
                                data: controller.productDetail.info,
                                style: {
                                  'p': Style(textAlign: TextAlign.justify)
                                },
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                controller.expandedText();
                              },
                              child: AppText(
                                message: "Lihat Semua",
                                color: AppColors.textColor3,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 42.92,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGrey.withOpacity(0.40),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.remove)),
                                  ),
                                  Flexible(
                                      child: Container(
                                          color: AppColors.primaryColor,
                                          child: const TextField(
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                border: InputBorder.none),
                                          ))),
                                  Flexible(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 42.92,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGrey.withOpacity(0.40),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.remove)),
                                  ),
                                  Flexible(
                                      child: Container(
                                          color: AppColors.primaryColor,
                                          child: TextField())),
                                  Flexible(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  sectionCenter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            RatingBar(
              ratingWidget: RatingWidget(
                empty: Icon(
                  Icons.star_outline,
                  color: AppColors.ratingColor,
                ),
                full: Icon(
                  Icons.star,
                  color: AppColors.ratingColor,
                ),
                half: Icon(
                  Icons.star_outline,
                  color: AppColors.ratingColor,
                ),
              ),
              itemSize: 12.0,
              initialRating: controller.productDetail.rating ?? 0,
              minRating: controller.productDetail.rating ?? 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            AppText(
              message: "12",
              fontSize: 12,
              color: AppColors.textColor2,
            ),
            AppText(
              message: "Reviews",
              fontSize: 12,
              color: AppColors.textColor2,
            )
          ],
        ),
        Container(
          width: 1,
          color: AppColors.lightGrey,
          height: 64,
        ),
        Column(
          children: [
            Image.asset(
              'assets/images/ic_point-1@2x.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            AppText(
              message: "${controller.productDetail.points ?? 0}",
              fontSize: 20,
              color: AppColors.textColor3,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              message: "Points",
              fontSize: 12,
              color: AppColors.textColor2,
            )
          ],
        ),
        Container(
          width: 1,
          color: AppColors.lightGrey,
          height: 64,
        ),
        Column(
          children: [
            controller.productDetail.isWishlist == 1
                ? Image.asset(
                    'assets/images/ic_wishlist_click.png',
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    'assets/images/ic_wishlist.png',
                    height: 25,
                    width: 25,
                  ),
            const SizedBox(
              height: 5,
            ),
            AppText(
              message: "Add to",
              fontSize: 12,
              color: AppColors.textColor2,
            ),
            AppText(
              message: "Wishlist",
              fontSize: 12,
              color: AppColors.textColor2,
            )
          ],
        ),
      ],
    );
  }
}
