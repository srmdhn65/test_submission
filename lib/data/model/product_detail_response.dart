// To parse this JSON data, do
//
//     final productDetailReponse = productDetailReponseFromJson(jsonString);

import 'dart:convert';

ProductDetailReponse productDetailReponseFromJson(String str) =>
    ProductDetailReponse.fromJson(json.decode(str));

String productDetailReponseToJson(ProductDetailReponse data) =>
    json.encode(data.toJson());

class ProductDetailReponse {
  ProductDetailReponse({
    this.data,
  });

  ProductDetail? data;

  factory ProductDetailReponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailReponse(
        data: ProductDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ProductDetail {
  ProductDetail({
    this.id,
    this.type,
    this.attributes,
  });

  String? id;
  String? type;
  Attributes? attributes;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        type: json["type"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes!.toJson(),
      };
}

class Attributes {
  Attributes({
    this.id,
    this.name,
    this.info,
    this.description,
    this.points,
    this.slug,
    this.stock,
    this.images,
    this.isNew,
    this.rating,
    this.numOfReviews,
    this.isWishlist,
  });

  int? id;
  String? name;
  String? info;
  String? description;
  int? points;
  String? slug;
  int? stock;
  List<String>? images;
  int? isNew;
  double? rating;
  int? numOfReviews;
  int? isWishlist;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        id: json["id"],
        name: json["name"],
        info: json["info"],
        description: json["description"],
        points: json["points"] ?? 0,
        slug: json["slug"],
        stock: json["stock"] ?? 0,
        images: List<String>.from(json["images"].map((x) => x)),
        isNew: json["isNew"],
        rating: json["rating"].toDouble(),
        numOfReviews: json["numOfReviews"],
        isWishlist: json["isWishlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "info": info,
        "description": description,
        "points": points,
        "slug": slug,
        "stock": stock,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "isNew": isNew,
        "rating": rating,
        "numOfReviews": numOfReviews,
        "isWishlist": isWishlist,
      };
}
