import 'package:flutter/material.dart';
import 'package:smart_vendors/controller/authController.dart';

//Navigation bar widget
class BottomAppBarSmartVendors extends StatelessWidget {
  const BottomAppBarSmartVendors({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 50,
      notchMargin: 15.0,
      shape: CircularNotchedRectangle(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/profile', (route) => false);
              },
              child: Icon(
                Icons.account_circle,
                color: Theme.of(context).accentColor,
              ),
            ),
            //   FlatButton(
            //     onPressed: () {
            //       Navigator.pushNamedAndRemoveUntil(
            //           context, '/scanProduct', (route) => false);
            //     },
            //     child: Icon(
            //       Icons.camera_alt,
            //       color: Theme.of(context).accentColor,
            //     ),
            //   ),
            //   Padding(
            //     padding: EdgeInsets.only(left: 30, right: 20),
            //   ),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Icon(
                  Icons.qr_code,
                  color: Theme.of(context).accentColor,
                )),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
            ),
            FlatButton(
                onPressed: () {},
                child: Visibility(
                    visible: false,
                    child: Icon(
                      Icons.qr_code,
                      color: Theme.of(context).accentColor,
                    ))),
            FlatButton(
              onPressed: () {
                AuthController.deleteLogin();
                AuthController.deleteAutoLogin();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingActionButtonSmartVendors extends StatelessWidget {
  const FloatingActionButtonSmartVendors({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 140,
      child: FloatingActionButton(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Image(
            image: AssetImage("assets/logo.png"),
          ),
        ),
        backgroundColor: Colors.white,
        onPressed: () {/**/},
      ),
    );
  }
}
