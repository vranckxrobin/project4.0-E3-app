import 'package:flutter/material.dart';
import 'package:smart_vendors/controller/alertController.dart';
import 'package:smart_vendors/controller/userController.dart';
import 'package:smart_vendors/widgets/CloudTopLeftClipper.dart';
import 'package:smart_vendors/widgets/FlatButtonSmartVendors.dart';
import 'package:smart_vendors/widgets/TextFieldSmartVendors.dart';
import 'package:smart_vendors/controller/authController.dart';
import 'package:smart_vendors/models/login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkedValue = false;
  void _login() {
    UserController.login(
            email: emailController.text, password: passwordController.text)
        .then((result) async {
      if (result) {
        Login login = new Login(
            email: emailController.text, password: passwordController.text);
        AuthController.setLogin(login);
        AuthController.setAutoLogin(checkedValue);
        AlertController()
            .show(text: "U bent ingelogd", title: "Login", type: "GOOD");
        await new Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamed(context, '/home');
      }
    });
  }

  void _autoLogin() async {
    var autologin = await AuthController.getAutoLogin();
    debugPrint("autologin");
    debugPrint(autologin.toString());
    if (autologin) {
      var login = await AuthController.getLogin();
      debugPrint("login");

      debugPrint(login.toString());
      UserController.login(email: login.email, password: login.password)
          .then((result) async {
        if (result) {
          Navigator.pushNamed(context, '/home');
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _autoLogin();
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
                          "Login",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        _inputForm(),
                        Container(
                          width: double.infinity,
                          child: FlatButtonSmartVendors(
                            text: "Login",
                            onPressed: () {
                              _login();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // FlatButton(
                        //   onPressed: () =>
                        //       {Navigator.pushNamed(context, '/registration')},
                        //   child: Text("Registeren"),
                        //   textColor: Theme.of(context).primaryColor,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButtonGshop(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBarGshop(),
    );
  }

  _inputForm() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        TextFieldGshop(
          labelText: "email",
          icon: Icon(
            Icons.email,
          ),
          controller: emailController,
          context: context,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 20,
        ),
        TextFieldGshop(
          labelText: "Wachtwoord",
          icon: Icon(
            Icons.vpn_key,
          ),
          controller: passwordController,
          context: context,
          keyboardType: TextInputType.visiblePassword,
          // hidden text password field
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        CheckboxListTile(
          title: Text("automatisch inloggen?"),
          value: checkedValue,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
