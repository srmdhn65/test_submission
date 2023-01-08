import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHelper {
  buildBasicShimmer(
      {double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade50,
      highlightColor: Colors.grey.shade200,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }
}
