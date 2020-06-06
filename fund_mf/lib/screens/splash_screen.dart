import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundmf/components/login_scaffold_widget.dart';
import 'package:fundmf/models/myUser.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:fundmf/utils/routes_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getUser() {
    if (MyUser().user != null) {
      LoggingHelper.logger.d('User not null');
      Routes().replace(context, Routes.welcome);
    } else {
      LoggingHelper.logger.w('User is null');
      Routes().replace(context, Routes.home);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      LoggingHelper.logger.i('Splash Done');
      getUser();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScaffoldWidget(
      appBarTitle: '',
      actions: <Widget>[],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('lib/images/Logo.png'),
                    height: 200,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            SpinKitCircle(
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
