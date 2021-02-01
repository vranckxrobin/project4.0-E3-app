import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'style/custom_color_scheme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_vendors/pages/routeGenerator.dart';
import 'package:smart_vendors/controller/alertController.dart';
import 'package:smart_vendors/controller/userController.dart';

Future main() async {
  // envioment variable
  await DotEnv().load('.env');
  //...runapp
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartVendors',
      theme: gShopTheme,
      initialRoute: '/',
      // Work with Generate routes
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
