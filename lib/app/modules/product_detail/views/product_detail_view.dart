import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'This is Product Detail screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
