import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/authserice.dart';
import 'package:wyttle_app/services/baseservice.dart';

class UserService extends AuthService {
  // ignore: missing_return
  static Future getUser() async {
    var auth = await AuthService.getSavedAuth();
    http.Response response = await AuthService.makeAuthenticatedRequest(
        BaseService.BASE_URI + '/user/${auth['id']}',
        method: 'GET');
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      User user = User.fromJson(responseMap);
      return user;
    } else {
      return responseMap["message"];
    }
  }

  static Future<bool> updateUser(var payload) async {
    http.Response response = await AuthService.makeAuthenticatedRequest(
        BaseService.BASE_URI + '/user/update/',
        method: 'PUT',
        body: payload);
    if (response.statusCode == 200) {
      return true;
    } else {
      print("Debug update user");
      return false;
    }
  }
}