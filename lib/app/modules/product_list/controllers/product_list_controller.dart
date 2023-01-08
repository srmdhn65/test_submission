import 'package:flutter/material.dart';
import 'package:flutter_tech_test/data/model/product_response.dart';
import 'package:flutter_tech_test/data/repository/product_repository.dart';
import 'package:get/get.dart';

import '../../../config/app_colors.dart';
import '../../../extensiens/pagination.dart';

class ProductListController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  final _products = <Products>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final _scrollcontroller = ScrollController();
  final _isLoading = true.obs;
  final _shoLoading = false.obs;
  var idProduct = ''.obs;

  List<Products> get product => _products.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;
  bool get isLoading => _isLoading.value;
  bool get showLoading => _shoLoading.value;
  get onRefresh => _refreshList();
  get onWishlist => _onWishlist();

  ScrollController get scrollController => _scrollcontroller;
  @override
  void onInit() {
    ever(_paginationFilter, (_) => _initList());
    _changePaginationFilter(1, 4);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // TODO method : get data list product
  void _initList() async {
    try {
      var response =
          await _productRepository.getProduct(_paginationFilter.value);
      List<Products> list = response.data!;

      if (list.isEmpty) {
        _lastPage.value = true;
        _isLoading.value = false;
        _shoLoading.value = false;
        return;
      }
      _products.addAll(list);
      _isLoading.value = false;
      _shoLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      _shoLoading.value = false;
    }
  }

  // TODO method : do refresh data list product
  Future<void> _refreshList() async {
    _isLoading.value = true;
    _products.clear();
    _changePaginationFilter(1, 4);
  }

  // TODO method : do add/remove wishlist item
  void _onWishlist() async {
    var res = await _productRepository.addWishlist(id: idProduct.value);
    if (res['status_code'] != 200) {
      Get.snackbar("Warning", "Pemesan Melebihi Stock",
          backgroundColor: Colors.orange, colorText: AppColors.primaryColor);
      return;
    }
    Get.snackbar("Success", "Add To Wishlist",
        backgroundColor: AppColors.textColor3,
        colorText: AppColors.primaryColor);
  }

  // TODO method : move to product detail screen
  void _toProductDetail() {}
  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void loadNextPage() {
    _shoLoading.value = true;
    _changePaginationFilter(_page + 1, limit);
  }
}
