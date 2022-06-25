import 'dart:io';

import 'package:dio/dio.dart';
import '../api/httpservices.dart';

import 'package:mime/mime.dart';
import '../models/product.dart';
import '../response/productresponse.dart';
import '../utils/url.dart';
import 'package:http_parser/http_parser.dart';

class ProductAPI {
  Future<bool> addProduct(File? file, Product product) async {
    try {
      var url = baseUrl + getProductsUrl;
      var dio = HttpServices().getInstance();
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);

        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
          contentType: MediaType("image", mimeType!.split("/")[1]),
        ); // image/jpeg -> jpeg
      }

      var formData = FormData.fromMap({
        "brandName": product.brandName,
        "productName": product.productName,
        "description": product.productDescription,
        "productPrice": product.productPrice,
        "category": product.rentCategory,
        "rentPrice": product.rentPrice,
        "color": product.color,
        "size": product.size,
      });
      var response = await dio.post(url, data: formData);

      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }

    return false;
  }

  Future<ProductResponse?> getProducts() async {
    Future.delayed(const Duration(seconds: 2), () {});
    ProductResponse? productResponse;
    try {
      var url = baseUrl + getProductsUrl;
      var dio = HttpServices().getInstance();
      Response response = await dio.getUri(Uri.parse(url));
      if (response.statusCode == 201) {
        productResponse = ProductResponse.fromJson(response.data);
      } else {
        productResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return productResponse;
  }
}
