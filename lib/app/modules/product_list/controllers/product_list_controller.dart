import 'package:flutter/material.dart';
import 'package:flutter_tech_test/data/model/product_response.dart';
import 'package:flutter_tech_test/data/repository/product_repository.dart';
import 'package:get/get.dart';

import '../../../extensiens/pagination.dart';

class ProductListController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  final _products = <Products>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final _scrollcontroller = ScrollController();
  final _isLoading = true.obs;
  final _shoLoading = false.obs;

  List<Products> get product => _products.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;
  bool get isLoading => _isLoading.value;
  bool get showLoading => _shoLoading.value;

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
      print(e);
      _isLoading.value = false;
      _shoLoading.value = false;
    }
  }

  // TODO method : do refresh data list product
  Future<void> refreshList() async {
    print('object');
    _isLoading.value = true;
    _products.clear();
    _changePaginationFilter(1, 4);
  }

  // TODO method : do add/remove wishlist item
  void _onWishlist() {}

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
