import 'package:flutter/material.dart';
import 'package:fundmf/screens/home_screen.dart';
import 'package:fundmf/screens/listing_screen.dart';
import 'package:fundmf/screens/login_screen.dart';
import 'package:fundmf/screens/mf_screen.dart';
import 'package:fundmf/screens/profile_screen.dart';
import 'package:fundmf/screens/register_screen.dart';
import 'package:fundmf/screens/splash_screen.dart';
import 'package:fundmf/utils/routes_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FundMF',
      theme: ThemeData.light(),
      routes: {
        Routes.splash: (context) => SplashScreen(),
        Routes.home: (context) => HomeScreen(),
        Routes.login: (context) => LoginScreen(),
        Routes.welcome: (context) => ListingScreen(),
        Routes.register: (context) => RegisterScreen(),
        Routes.mfDetails: (context) => MutualFundScreen(),
        Routes.profile: (context) => ProfileScreen(),
      },
      initialRoute: Routes.splash,
    );
  }
}
