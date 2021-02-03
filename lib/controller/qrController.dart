import 'package:smart_vendors/apis/qrCode_api.dart';
import 'package:smart_vendors/controller/authController.dart';
import 'package:smart_vendors/controller/alertController.dart';
import '../models/user.dart';

/*
Qrcontroller
*/
class QrController {
  //get qr code for user
  static Future<String> getQrCode() async {
    User user = await AuthController.getUser();
    String qrCode = await QrCodeApi.getQrCode(user);
    return qrCode;
  }

  //create qr code for user
  static Future<String> createQrcode() async {
    User user = await AuthController.getUser();
    return QrCodeApi.createQrcode(user).then((qrCode) {
      return qrCode;
    }).catchError((error) {
      AlertController()
          .show(text: error.message, title: "Server", type: "ERROR");
      return false;
    });
  }
}
