import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_tech_test/app/routes/app_pages.dart';
import 'package:flutter_tech_test/data/model/product_response.dart';
import 'package:get/get.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text.dart';
import '../../../extensiens/font_text.dart';

class ProductCard extends StatelessWidget {
  final Attributes products;
  const ProductCard({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {'id': products.id});
      },
      child: Container(
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
                      child: products.images == null
                          ? Image.asset(
                              "assets/images/img_produk_2@2x.png",
                              width: 102.19,
                              height: 135.66,
                              fit: BoxFit.contain,
                            )
                          : Container(
                              width: 102.19,
                              height: 135.66,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        products.images![0],
                                      ),
                                      fit: BoxFit.fill)),
                            )),
                  const SizedBox(
                    height: 5,
                  ),
                  AppText(
                    message: products.name ?? "",
                    fontSize: 12,
                    fontFamily: FontTexts.fontRaleway,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_point@2x.png',
                        width: 10,
                        height: 10,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                        message: "${products.points} points",
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
                            initialRating: products.rating ?? 0,
                            minRating: products.rating ?? 1,
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
                            message: "${products.numOfReviews} Reviews",
                            fontSize: 10,
                            color: AppColors.textColor2,
                            fontStyle: FontStyle.italic,
                            fontFamily: FontTexts.fontRaleway,
                          ),
                        ],
                      ),
                      products.isWishlist == 1
                          ? Image.asset(
                              'assets/images/ic_wishlist_click.png',
                              height: 25,
                              width: 25,
                            )
                          : Image.asset(
                              'assets/images/ic_wishlist.png',
                              height: 25,
                              width: 25,
                            )
                    ],
                  )
                ],
              ),
            ),
            products.isNew == 1
                ? Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/images/ic_new@2x.png",
                      height: 45,
                      width: 45,
                    ))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
