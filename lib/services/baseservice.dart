import 'package:http/http.dart' as http;

class BaseService {
  static const BASE_URI = "http://20.84.89.186/api/v1";

  static final Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  static Future getAppCurrentVersion() async {
    http.Response response =
        await http.get(Uri.parse("http://20.84.89.186/version"));
    return response.body;
  }

  // ignore: missing_return
  static Future makeUnauthenticatedRequest(String url,
      {String method = 'POST',
      body,
      mergeDefaultHeader = true,
      required Map<String, String> extraHeaders}) async {
    try {
      var sentHeaders =
          mergeDefaultHeader ? {...headers, ...extraHeaders} : extraHeaders;

      switch (method) {
        case 'POST':
          body ??= {};
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);

        case 'GET':
          return http.get(Uri.parse(url), headers: headers);

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
}