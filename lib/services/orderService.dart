import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wyttle_app/models/order.dart';
import 'package:wyttle_app/services/authserice.dart';
import 'package:wyttle_app/services/baseservice.dart';

class OrderService extends AuthService {
  // ignore: missing_return
  static Future getAllOrdersByUserId(id) async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        BaseService.BASE_URI + '/order/user/$id',
        method: 'GET');
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      List<Order> orders = responseMap
          .map<Order>((usersMap) => Order.fromJson(usersMap))
          .toList();
      return orders;
    } else {
      return false;
    }
  }

  static Future createorder(payload) async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
      BaseService.BASE_URI + '/order/',
      method: 'POST',
      body: payload,
    );
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future updateOrder(payload) async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
      BaseService.BASE_URI + '/order/',
      method: 'PUT',
      body: payload,
    );
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      // Order orders = Order.fromJson(responseMap);
      return true;
    } else {
      return false;
    }
  }
}
