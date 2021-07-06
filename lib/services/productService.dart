import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wyttle_app/models/product.dart';
import 'package:wyttle_app/services/authserice.dart';
import 'package:wyttle_app/services/baseservice.dart';

class ProductService extends AuthService {
  // ignore: missing_return
  static Future getAllProducts() async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        BaseService.BASE_URI + '/product/',
        method: 'GET');
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      List<Product> products = responseMap
          .map<Product>((usersMap) => Product.fromJson(usersMap))
          .toList();
      return products;
    } else {
      return false;
    }
  }

  static Future gethomeProducts() async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        BaseService.BASE_URI + '/product/home',
        method: 'GET');
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      List<Product> products = responseMap
          .map<Product>((usersMap) => Product.fromJson(usersMap))
          .toList();
      return products;
    } else {
      return false;
    }
  }

  static Future getProductById(id) async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        BaseService.BASE_URI + '/product/$id',
        method: 'GET');
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      Product product = Product.fromJson(responseMap);
      return product;
    } else {
      return false;
    }
  }

  static Future getProductByCategroy(id) async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        BaseService.BASE_URI + '/product/category/$id',
        method: 'GET');
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      List<Product> products = responseMap
          .map<Product>((usersMap) => Product.fromJson(usersMap))
          .toList();
      return products;
    } else {
      return false;
    }
  }
}
