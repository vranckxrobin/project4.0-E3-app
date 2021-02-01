import 'package:flutter/material.dart';

checkIfAuthenticated() async {
  await Future.delayed(Duration(
      seconds: 2)); // could be a long running task, like a fetch from keychain
  return false;
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checkIfAuthenticated().then((success) {
      if (success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
