import 'dart:async';
import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/baseservice.dart';
import 'package:wyttle_app/widgets/errorTokenWidget.dart';

class AuthService extends BaseService {
  static const String authNamespace = "auth";
  // ignore: missing_return
  static Future makeAuthenticatedRequest(String url,
      {String method = 'POST',
      body,
      mergeDefaultHeader = true,
      Map<String, String>? extraHeaders}) async {
    try {
      Map<String, dynamic> auth = await getSavedAuth();
      extraHeaders ??= {};
      var sentHeaders = mergeDefaultHeader
          ? {
              ...BaseService.headers,
              ...extraHeaders,
              "auth-token": "${auth['token']}"
            }
          : extraHeaders;

      switch (method) {
        case 'POST':
          body ??= {};
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);

        case 'GET':
          return http.get(Uri.parse(url), headers: sentHeaders);

        case 'PUT':
          return http.put(Uri.parse(url), headers: sentHeaders, body: body);

        case 'DELETE':
          return http.delete(Uri.parse(url), headers: sentHeaders);

        default:
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);
      }
    } catch (err) {
      print(err);
    }
  }

  static Future checkToken(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth = json.decode(prefs.getString("auth").toString());
    if (auth != null) {
      try {
        // Verify a token
        final jwt = JWT.verify(auth['token'], SecretKey('wyttle123'));
        print("Expires at " +
            DateTime.fromMillisecondsSinceEpoch(jwt.payload['exp'] * 1000,
                    isUtc: true)
                .toString());
                return true;
      } on JWTExpiredError {
        tokenErrorWiget(context);
        print('jwt expired');
        return false;
      } on JWTError catch (ex) {
        print(ex.message);
        tokenErrorWiget(context);
        return false;
      }
    }else{
      return false;
    }
  }

  static Future getSavedAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> auth = json.decode(prefs.getString("auth").toString());
    return auth;
  }

  static Future authenticate(
    String email,
    String password,
  ) async {
    var payload = json.encode({
      'email': email,
      'password': password,
    });
    http.Response response = await BaseService.makeUnauthenticatedRequest(
        BaseService.BASE_URI + '/auth/signin',
        body: payload,
        extraHeaders: {});
    Map<String, dynamic> responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      String token = responseMap['token'];
      String id = responseMap['user']['_id'].toString();
      await _saveToken(token, email, id);
      return responseMap["message"];
    } else {
      return responseMap["message"];
    }
  }

  static Future register(String name, String email, String password) async {
    var payload = json.encode({
      'name': name,
      'email': email,
      'password': password,
      'isVerified': true,
      'blocked': false,
    });
    http.Response response = await BaseService.makeUnauthenticatedRequest(
        BaseService.BASE_URI + '/auth/signup',
        body: payload,
        extraHeaders: BaseService.headers);
    print(response.body);
    var responseMap = json.decode(response.body);
    if (response.statusCode == 200) {
      // User user = User.fromJson(responseMap["user"]);
      // print(user.toJson());
      return responseMap["message"];
    } else {
      return responseMap["message"];
    }
  }

  static _saveToken(String token, String email, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "auth", json.encode({"token": token, "email": email, "id": id}));
  }

  static clearAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
