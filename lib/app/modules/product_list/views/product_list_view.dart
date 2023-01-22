import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/config/app_colors.dart';
import 'package:flutter_tech_test/app/modules/product_list/views/product_card.dart';
import 'package:flutter_tech_test/data/model/product_response.dart';

import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../controllers/product_list_controller.dart';
import 'loading_product.dart';

class ProductListView extends GetView<ProductListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Obx(() => controller.isLoading
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 23),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 23,
                    crossAxisSpacing: 23,
                    mainAxisExtent: 250),
                itemBuilder: (BuildContext context, int index) {
                  return LoadingCard();
                })
            : RefreshIndicator(
                onRefresh: () => controller.onRefresh,
                child: LazyLoadScrollView(
                    onEndOfPage: controller.loadNextPage,
                    isLoading: controller.lastPage,
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemCount: controller.product.length,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 23),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.7,
                                      mainAxisSpacing: 23,
                                      crossAxisSpacing: 23,
                                      mainAxisExtent: 250),
                              itemBuilder: (BuildContext context, int index) {
                                Products products = controller.product[index];
                                return ProductCard(
                                  products: products.attributes!,
                                );
                              }),
                        ),
                        controller.showLoading
                            ? Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(10),
                                child: const CircularProgressIndicator(),
                              )
                            : const SizedBox()
                      ],
                    )),
              )),
      ),
    );
  }
}
