import 'package:flutter/material.dart';
import 'package:fundmf/components/alert_widget.dart';
import 'package:fundmf/components/login_scaffold_widget.dart';
import 'package:fundmf/components/rounded_button.dart';
import 'package:fundmf/models/myUser.dart';
import 'package:fundmf/models/user.dart';
import 'package:fundmf/models/user_list.dart';
import 'package:fundmf/utils/constants.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:fundmf/utils/routes_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  UserList userList = UserList();

  void showAlert() {
    AlertWidget alert = AlertWidget(
      title: Text('Login Error'),
      messages: <Widget>[
        Text(
            'Email and Password do not match. Please enter a valid credentials or register yourself '),
      ],
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void login() {
    LoggingHelper.logger.d('Logging In');
    Routes().replace(context, Routes.welcome);
  }

  void showHideSpinner(spinner) {
    setState(() {
      showSpinner = spinner;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginScaffoldWidget(
      appBarTitle: 'Log In',
      actions: <Widget>[],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Container(
            child: SingleChildScrollView(
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
                  TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Email-id',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (newValue) {
                      email = newValue;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Password',
                    ),
                    onChanged: (newValue) {
                      password = newValue;
                    },
                  ),
                  RoundedButton(
                    onPressed: () {
                      showHideSpinner(true);
                      try {
                        if (userList.users.isNotEmpty) {
                          bool isUser = false;
                          for (User r in userList.users) {
                            if (r.email.toLowerCase() == email.toLowerCase() &&
                                r.password == password) {
                              isUser = true;
                              MyUser loginUser = MyUser();
                              loginUser.login(r);
                              break;
                            }
                          }
                          showHideSpinner(false);
                          isUser ? login() : showAlert();
                        } else {
                          showHideSpinner(false);
                          showAlert();
                        }
                      } catch (ex, stack) {
                        LoggingHelper.logger.e(ex);
                      }
                    },
                    buttonColor: Colors.teal,
                    buttonText: 'Log In',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
