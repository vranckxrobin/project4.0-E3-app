import 'package:flutter/material.dart';
import 'package:smart_vendors/pages/home.dart';
import 'package:smart_vendors/pages/login.dart';
import 'package:smart_vendors/pages/profile.dart';

//routes to navigate to other pages
class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('error'),
      ),
      body: Center(
        child: Text('Error'),
      ),
    );
  });
}
