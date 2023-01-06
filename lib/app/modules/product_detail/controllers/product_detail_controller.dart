import 'package:flutter_tech_test/data/model/product_detail_response.dart';
import 'package:get/get.dart';

import '../../../../data/repository/product_repository.dart';

class ProductDetailController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  final _productsDetail = Attributes().obs;
  final _expandinfo = false.obs;

  final _isLoading = true.obs;

  Attributes get productDetail => _productsDetail.value;

  bool get isLoading => _isLoading.value;
  bool get expandedInfo => _expandinfo.value;
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
      print(e);
      _isLoading(false);
    }
  }

  // TODO method : see/hide product description
  void _onSeeMoreDescription() {}

  // TODO method : do add/remove wishlist item
  void _onWishlist() {}

  // TODO method : increase quantity of product
  void _addQuantity() {
    
  }

  // TODO method : decrease quantity of product
  void _detractQuantity() {}

  // TODO method : add product to cart
  void _addToCart() {}

  // TODO method : do proceed buy/redeem product
  void _redeemProduct() {}

  void expandedText() {
    _expandinfo.value = !_expandinfo.value;
  }
}
