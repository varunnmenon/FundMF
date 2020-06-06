import 'package:flutter/material.dart';
import 'package:fundmf/components/login_scaffold_widget.dart';
import 'package:fundmf/components/rounded_button.dart';
import 'package:fundmf/utils/routes_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            RoundedButton(
              onPressed: () {
                //Go to login screen.
                Routes().push(context: context, route: Routes.login);
              },
              buttonColor: Colors.teal,
              buttonText: 'Log In',
            ),
            RoundedButton(
              onPressed: () {
                //Go to register screen.
                Routes().push(context: context, route: Routes.register);
              },
              buttonColor: Colors.blueAccent,
              buttonText: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
