import 'dart:convert';
import 'package:smart_vendors/models/auth.dart';
import 'package:smart_vendors/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_vendors/models/login.dart';

/*
 
Save authentication token internal storage.
Save user object internal storage, for display the user object
*/
class AuthController {
  static final String _authToken = "auth_token";
  static final String _userObject = "user";
  static final String _autologin = "autologin";
  static final String _login = "login";

  static Future<void> setAuthToken(Auth auth) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_authToken, auth.accessToken);
  }

  static Future<Auth> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token;
    token = pref.getString(_authToken) ?? null;
    return new Auth(accessToken: token);
  }

  static Future<void> deleteAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(_authToken);
  }

  static Future<void> setUser(User newUser) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userObject, jsonEncode(newUser));
  }

  static Future<User> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String userString;
    userString = pref.getString(_userObject) ?? null;

    return User.fromJson(jsonDecode(userString));
  }

  static Future<void> deleteUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(_userObject);
  }

  static Future<void> setAutoLogin(bool autologin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_autologin, jsonEncode(autologin));
  }

  static Future<bool> getAutoLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String autologinString;
    autologinString = pref.getString(_autologin) ?? "false";

    return jsonDecode(autologinString);
  }

  static Future<void> deleteAutoLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(_autologin);
  }

  static Future<void> setLogin(Login login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_login, jsonEncode(login));
  }

  static Future<Login> getLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String loginString;
    loginString = pref.getString(_login) ?? null;

    return Login.fromJson(jsonDecode(loginString));
  }

  static Future<void> deleteLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(_login);
  }
}
