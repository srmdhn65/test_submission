import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/config/app_colors.dart';
import 'package:flutter_tech_test/data/model/product_detail_response.dart';
import 'package:get/get.dart';

import '../../../../data/repository/product_repository.dart';

class ProductDetailController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  final _productsDetail = Attributes().obs;
  final _showMore = false.obs;
  final _quantity = 0.obs;
  final _isLoading = true.obs;
  final _quantityController = TextEditingController(text: "0");

  Attributes get productDetail => _productsDetail.value;

  bool get isLoading => _isLoading.value;
  bool get showMore => _showMore.value;
  int get quantity => _quantity.value;
  TextEditingController get quantityController => _quantityController;
  void get onSeeMoreDescription => _onSeeMoreDescription();
  void get addQuantity => _addQuantity();
  void get detrackQuantity => _detractQuantity();
  void get addToCart => _addToCart();
  void get redeemProduct => _redeemProduct();
  void get addToWishlist => _onWishlist();

  var data = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    _initProductDetail();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // TODO method : get data detail product
  void _initProductDetail() async {
    String id = data['id'].toString();

    try {
      var res = await _productRepository.getProductDetail(id: id);
      if (res.data!.attributes == null) {
        _isLoading(false);
        return;
      }
      _productsDetail.value = res.data!.attributes!;
      _isLoading(false);
    } catch (e) {
      _isLoading(false);
    }
  }

  // TODO method : see/hide product description
  void _onSeeMoreDescription() {
    _showMore.toggle();
  }

  // TODO method : do add/remove wishlist item
  void _onWishlist() async {
    String id = data['id'].toString();
    var res = await _productRepository.addWishlist(id: id);
    if (res['status_code'] != 200) {
      Get.snackbar("Warning", "Pemesan Melebihi Stock",
          backgroundColor: Colors.orange, colorText: AppColors.primaryColor);
      return;
    } else if (res['data'] == null) {
      _productsDetail.value.isWishlist =
          _productsDetail.value.isWishlist == 1 ? 0 : 1;
      Get.snackbar("Success", "Add To Wishlist",
          backgroundColor: AppColors.textColor3,
          colorText: AppColors.primaryColor);
      update();
      return;
    }
    _initProductDetail();

    Get.snackbar("Success", "Add To Wishlist",
        backgroundColor: AppColors.textColor3,
        colorText: AppColors.primaryColor);
    update();
  }

  // TODO method : increase quantity of product
  void _addQuantity() {
    var value = int.parse(_quantityController.text);
    if (value < _productsDetail.value.stock!) {
      value++;
      _quantityController.text = value.toString();
    } else if (value > _productsDetail.value.stock!) {
      _quantityController.text = _productsDetail.value.stock.toString();
      Get.snackbar("Warning", "Pemesan Melebihi Stock",
          backgroundColor: Colors.orange, colorText: AppColors.primaryColor);
    } else {
      Get.snackbar("Warning", "Stock Kosong",
          backgroundColor: Colors.orange, colorText: AppColors.primaryColor);
    }
  }

  // TODO method : decrease quantity of product
  void _detractQuantity() {
    var value = int.parse(_quantityController.text);
    if (value < 1) {
      _quantityController.text = '0';
    } else {
      value--;
      _quantityController.text = value.toString();
    }
  }

  // TODO method : add product to cart
  void _addToCart() {
    var value = int.parse(_quantityController.text);
    if (value >= 1) {
      Get.snackbar("Success", "Add To Cart Berhasil",
          backgroundColor: AppColors.textColor3,
          colorText: AppColors.primaryColor);
    }
  }

  // TODO method : do proceed buy/redeem product
  void _redeemProduct() {
    var value = int.parse(_quantityController.text);
    if (value >= 1) {
      Get.snackbar("Success", "Redeem '${_productsDetail.value.name} Berhasil",
          backgroundColor: AppColors.textColor3,
          colorText: AppColors.primaryColor);
    }
  }
}
