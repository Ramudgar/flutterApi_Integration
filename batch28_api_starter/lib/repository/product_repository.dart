import 'dart:io';

import 'package:batch28_api_starter/api/product_api.dart';
import 'package:batch28_api_starter/api/user_api.dart';

import '../model/user.dart';

class ProductRepository {
  Future<bool> addProduct(File? file) async {
    return ProductAPI().addProduct(file);
  }
}
