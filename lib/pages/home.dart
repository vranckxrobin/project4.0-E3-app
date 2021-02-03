import 'package:flutter/material.dart';
import 'package:smart_vendors/widgets/BottomAppBarSmartVendors.dart';
import 'package:smart_vendors/widgets/CloudTopLeftClipper.dart';
import 'package:smart_vendors/widgets/FlatButtonSmartVendors.dart';
import 'package:smart_vendors/controller/qrController.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../models/user.dart';
import 'package:smart_vendors/controller/userController.dart';
import 'package:smart_vendors/controller/alertController.dart';
import 'package:smart_vendors/controller/authController.dart';


//show qr code,shows limit hand gels and lets you get a new qrcode 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String authentication = "";
  bool createQrcodeVisible = false;
  String handgelUse = "";

  getAuthentication() async {
    return QrController.getQrCode();
  }

  createQrcode() async {
    QrController.createQrcode().then((result) async {
      if (result.length > 0) {
        //Navigator.pushNamed(context, '/home');
        setState(() {
          authentication = result;
        });
        AlertController().show(
            text: "de qr code is aangemaakt", title: "QrCode", type: "GOOD");
        await new Future.delayed(const Duration(seconds: 2));
      }
    });
    getHandgelUse().then((handgel) async {
      setState(() {
        handgelUse = handgel;
      });
    });
  }

  getUserPermission() async {
    User user = await AuthController.getUser();
    if (user.permissions.contains("AUTHENTICATION_CREATE")) {
      return true;
    } else if (user.permissions.contains("AUTHENTICATION_CREATE_COMPANY")) {
      return true;
    } else if (user.permissions.contains("AUTHENTICATION_CREATE_COMPANY_OWN")) {
      return true;
    } else {
      return false;
    }
  }

  getHandgelUse() async {
    return await UserController.getHandgelUse();
  }

  @override
  void initState() {
    super.initState();

    getAuthentication().then((value) {
      setState(() {
        authentication = value;
      });
    });

    getUserPermission().then((permission) {
      setState(() {
        createQrcodeVisible = permission;
      });
    });

    getHandgelUse().then((handgel) => {
          setState(() {
            handgelUse = handgel;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        child: Stack(
          children: [
            ClipPath(
              clipper: CloudTopLeftClipper(),
              child: Container(
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text: 'S',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            TextSpan(
                              text: 'martVendors',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: handgelUse != "",
                        child: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: handgelUse + ' handgels',
                                        style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Visibility(
                          visible: authentication != "",
                          child: QrImage(
                            data: authentication,
                            version: QrVersions.auto,
                            size: 300.0,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Visibility(
                          visible: createQrcodeVisible,
                          child: FlatButtonSmartVendors(
                            onPressed: () {
                              createQrcode();
                            },
                            text: "nieuwe qrcode",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonSmartVendors(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarSmartVendors(),
    );
  }
}
