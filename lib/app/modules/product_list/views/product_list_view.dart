import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/config/app_colors.dart';
import 'package:flutter_tech_test/app/config/app_text.dart';

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
                    Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          "assets/images/ic_new@2x.png",
                          height: 45,
                          width: 45,
                        )),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/img_produk_2@2x.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          message: "Samsung Galaxy S9",
                          fontSize: 12,
                        )
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
