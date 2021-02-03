import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserApi {
  static String url = DotEnv().env['API_URL'];

  //Login user get authentication token back
  static Future<User> loginUser({String email, String password}) async {
    final http.Response response = await http.post(
      url + 'user/authenticate',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> resultList = jsonDecode(response.body);
      return User.fromJson(resultList["result"]);
    } else {
      throw Exception(response.body);
    }
  }

  //update password from user
  static Future<User> updatePasswordUser(User user, String password) async {
    final http.Response response = await http.put(
      url + 'user/' + user.id.toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + user.accessToken,
      },
      body: jsonEncode({"password": password}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> resultList = jsonDecode(response.body);
      return User.fromJson(resultList["result"]);
    } else {
      throw Exception(response.body);
    }
  }

  //get how many hand gels you have used and what is the limit
  static Future<String> getHandgelUse(User user) async {
    final http.Response response = await http.get(
      url + 'user/handgelLimit/' + user.id.toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + user.accessToken,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> resultList = jsonDecode(response.body);
      Map<String, dynamic> result = resultList["result"];
      String handgelUse = result["handgels"];
      return handgelUse;
    } else {
      return "";
    }
  }
}
