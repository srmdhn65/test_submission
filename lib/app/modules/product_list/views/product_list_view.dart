import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/config/app_colors.dart';
import 'package:flutter_tech_test/app/config/app_text.dart';
import 'package:flutter_tech_test/app/extensiens/font_text.dart';

import 'package:get/get.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 23),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: 250),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.lightGrey)),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/img_produk_2@2x.png'),
                          AppText(
                            message: "Samsung Galaxy S9",
                            fontSize: 12,
                            fontFamily: FontTexts.fontRaleway,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              AppText(
                                message: "12.000.000",
                                fontSize: 12,
                                color: AppColors.textColor3,
                                fontFamily: FontTexts.fontRaleway,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  AppText(
                                    message: "120 Review",
                                    fontSize: 12,
                                    color: AppColors.textColor2,
                                    fontFamily: FontTexts.fontRaleway,
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/images/ic_wishlist_click.png',
                                height: 25,
                                width: 25,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          "assets/images/ic_new@2x.png",
                          height: 45,
                          width: 45,
                        )),
                  ],
                ),
              );
            }));
  }
}
