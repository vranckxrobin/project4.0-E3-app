import 'package:flutter/material.dart';
import 'package:smart_vendors/controller/alertController.dart';
import 'package:smart_vendors/controller/userController.dart';
import 'package:smart_vendors/widgets/CloudTopLeftClipper.dart';
import 'package:smart_vendors/widgets/FlatButtonSmartVendors.dart';
import 'package:smart_vendors/widgets/TextFieldSmartVendors.dart';
import 'package:smart_vendors/widgets/BottomAppBarSmartVendors.dart';
import 'package:smart_vendors/controller/authController.dart';
import 'package:smart_vendors/models/login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void _updateWachtwoord() {
    if (passwordController.text == passwordConfirmController.text) {
      UserController.updatePassword(password: passwordController.text)
          .then((result) async {
        if (result) {
          Login login = await AuthController.getLogin();
          login.password = passwordController.text;
          AuthController.setLogin(login);
          AlertController().show(
              text: "U wachtwoord is geupdate",
              title: "Update Wachtwoord",
              type: "GOOD");
          await new Future.delayed(const Duration(seconds: 1));
          Navigator.pushNamed(context, '/home');
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
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
                color: Theme.of(context).accentColor.withOpacity(0.4),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Wachtwoord updaten",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        _inputForm(),
                        Container(
                          width: double.infinity,
                          child: FlatButtonSmartVendors(
                            text: "update wachtwoord",
                            onPressed: () {
                              _updateWachtwoord();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
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

  _inputForm() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        TextFieldGshop(
          labelText: "wachwoord",
          icon: Icon(
            Icons.vpn_key,
          ),
          controller: passwordController,
          context: context,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        TextFieldGshop(
          labelText: "bevestig wachtwoord",
          icon: Icon(
            Icons.vpn_key,
          ),
          controller: passwordConfirmController,
          context: context,
          keyboardType: TextInputType.visiblePassword,
          // hidden text password field
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
