import 'package:flutter_tech_test/app/config/base_url.dart';
import 'package:flutter_tech_test/data/model/product_response.dart';
import 'package:http/http.dart' show Client;

import '../../app/extensiens/pagination.dart';
import '../model/product_detail_response.dart';

class ProductRepository {
  Client _http = Client();

  Future<ProductReponse> getProduct(PaginationFilter filter) async {
    var url = Uri.parse(
        "${AppConfig.baseUrl}${AppConfig.product}?page[number]=${filter.page}&page[size]=${filter.limit}");
    final response = await _http.get(url, headers: {
      "Content-Type": "application/json",
    });
    return productReponseFromJson(response.body);
  }

  Future<ProductDetailReponse> getProductDetail({id = 0}) async {
    var url = Uri.parse(
        "${AppConfig.baseUrl}${AppConfig.productdetail.replaceAll('{id}', id)}");

    final response = await _http.get(url, headers: {
      "Content-Type": "application/json",
    });
    print(response.body);
    return productDetailReponseFromJson(response.body);
  }
}
