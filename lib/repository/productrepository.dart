import 'dart:io';

import '../api/productapi.dart';
// import '../model/dropdown_category.dart';
import '../models/product.dart';
import '../response/productresponse.dart';

class ProductRepository {
  Future<bool> addProduct(File? file, Product product) async {
    return ProductAPI().addProduct(file, product);
  }

  Future<ProductResponse?> getProducts() async {
    return ProductAPI().getProducts();
  }
}
