import 'package:smart_vendors/apis/user_api.dart';
import 'package:smart_vendors/controller/authController.dart';
import 'package:smart_vendors/controller/alertController.dart';
import 'package:smart_vendors/models/user.dart';

/*
Usercontroller
*/
class UserController {
  static Future<bool> login({String email, String password}) async {
    return UserApi.loginUser(email: email, password: password).then((user) {
      // set user
      AuthController.setUser(user);
      return true;
    }).catchError((error) {
      AlertController()
          .show(text: error.message, title: "Server", type: "ERROR");
      return false;
    });
  }

  static Future<bool> updatePassword({String email, String password}) async {
    User user = await AuthController.getUser();
    return UserApi.updatePasswordUser(user, password).then((user) {
      return true;
    }).catchError((error) {
      AlertController()
          .show(text: error.message, title: "Server", type: "ERROR");
      return false;
    });
  }

  static Future<String> getHandgelUse() async {
    User user = await AuthController.getUser();
    String handgelUse = await UserApi.getHandgelUse(user);
    return handgelUse;
  }
}
