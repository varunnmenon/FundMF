import 'package:flutter/material.dart';

class Routes {
  static const String splash = 'Splash';
  static const String home = 'Home';
  static const String login = 'Login';
  static const String register = 'Register';
  static const String welcome = 'Listing';
  static const String profile = 'Profile';
  static const String mfDetails = 'MFScreen';

  void push({context, route, arguments = ''}) {
    Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }

  void replace(context, route) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  void pop() {}
}
