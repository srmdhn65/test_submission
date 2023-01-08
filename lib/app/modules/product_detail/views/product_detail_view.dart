import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_tech_test/app/config/app_colors.dart';
import 'package:flutter_tech_test/app/config/app_text.dart';
import 'package:flutter_tech_test/app/modules/product_detail/views/loading_detail.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';
import 'expanded_text.dart';

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
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading
            ? const LoadingDetail()
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
                            data: controller.productDetail.info,
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
                          ExpandableText(
                              controller.productDetail.description ?? ""),
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
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          onPressed: () =>
                                              controller.detrackQuantity,
                                          icon: const Icon(Icons.remove)),
                                    ),
                                  ),
                                  Flexible(
                                      flex: 4,
                                      child: Container(
                                          color: AppColors.primaryColor,
                                          child: TextField(
                                            controller:
                                                controller.quantityController,
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              if (value.isEmpty) {
                                                controller.quantityController
                                                    .text = '0';
                                              }
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                          ))),
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          onPressed: () =>
                                              controller.addQuantity,
                                          icon: const Icon(Icons.add)),
                                    ),
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
                                    color:
                                        AppColors.lightGrey.withOpacity(0.40),
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: AppColors.textColor3)),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        backgroundColor: AppColors.primaryColor,
                                        elevation: 0),
                                    onPressed: () => controller.addToCart,
                                    child: AppText(
                                      message: "Add To Cart",
                                      fontSize: 14,
                                      color: AppColors.textColor3,
                                    ))),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(27),
                        height: 42.92,
                        width: Get.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side:
                                        BorderSide(color: AppColors.textColor3),
                                    borderRadius: BorderRadius.circular(40)),
                                backgroundColor: AppColors.textColor3,
                                elevation: 0),
                            onPressed: () => controller.redeemProduct,
                            child: AppText(
                              message: "Redeem",
                              fontSize: 14,
                              color: AppColors.primaryColor,
                            ))),
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
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
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
        GetBuilder<ProductDetailController>(builder: (detailController) {
          return Column(
            children: [
              InkWell(
                onTap: () => controller.addToWishlist,
                child: detailController.productDetail.isWishlist == 1
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
          );
        }),
      ],
    );
  }
}
