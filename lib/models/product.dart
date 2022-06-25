import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Product {
  String? brandName;
  String? productName;
  String? productDescription;
  String? productPrice;
  String? rentPrice;
  String? color;
  String? size;
  String? rentCategory;
  String? imageUrl;

  Product(
      {this.brandName,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.rentPrice,
      this.rentCategory,
      this.color,
      this.size,
      this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
