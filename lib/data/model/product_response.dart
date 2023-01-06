// To parse this JSON data, do
//
//     final productReponse = productReponseFromJson(jsonString);

import 'dart:convert';

ProductReponse productReponseFromJson(String str) =>
    ProductReponse.fromJson(json.decode(str));

String productReponseToJson(ProductReponse data) => json.encode(data.toJson());

class ProductReponse {
  ProductReponse({
    this.meta,
    this.data,
    this.links,
  });

  Meta? meta;
  List<Products>? data;
  Links? links;

  factory ProductReponse.fromJson(Map<String, dynamic> json) => ProductReponse(
        meta: Meta.fromJson(json["meta"]),
        data:
            List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta!.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
      };
}

class Products {
  Products({
    this.id,
    this.type,
    this.attributes,
  });

  String? id;
  String? type;
  Attributes? attributes;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
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
        points: json["points"],
        slug: json["slug"],
        stock: json["stock"],
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

class Links {
  Links({
    this.self,
    this.next,
    this.last,
  });

  String? self;
  String? next;
  String? last;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        next: json["next"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "next": next,
        "last": last,
      };
}

class Meta {
  Meta({
    this.totalItems,
    this.currentPage,
    this.itemPerPage,
    this.totalPages,
  });

  int? totalItems;
  int? currentPage;
  int? itemPerPage;
  int? totalPages;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        itemPerPage: json["itemPerPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "currentPage": currentPage,
        "itemPerPage": itemPerPage,
        "totalPages": totalPages,
      };
}
