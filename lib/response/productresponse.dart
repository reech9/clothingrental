class ProductResponse {
  bool? success;

  Map<String, dynamic>? productResponse;

  ProductResponse({this.success, this.productResponse});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'],
      productResponse: json['createdProduct'],
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'createdProduct': productResponse,
      };
}
