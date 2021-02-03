import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class QrCodeApi {
  static String url = DotEnv().env['API_URL'];

  //getQrCode for user
  static Future<String> getQrCode(User user) async {
    final http.Response response = await http.get(
      url + 'authentication/user/' + user.id.toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + user.accessToken,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> resultList = jsonDecode(response.body);
      Map<String, dynamic> result = resultList["result"];
      String authentication = result["authentication"];
      return authentication;
    } else {
      return "";
    }
  }
  //createQrcode for user
  static Future<String> createQrcode(User user) async {
    final http.Response response =
        await http.post(url + 'authentication/', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + user.accessToken,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> resultList = jsonDecode(response.body);
      Map<String, dynamic> result = resultList["result"];
      String authentication = result["authentication"];
      return authentication;
    } else {
      throw Exception(response.body);
    }
  }
}
