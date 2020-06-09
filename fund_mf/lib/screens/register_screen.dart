import 'package:flutter/material.dart';
import 'package:fundmf/components/alert_widget.dart';
import 'package:fundmf/components/form_field_widget.dart';
import 'package:fundmf/components/login_scaffold_widget.dart';
import 'package:fundmf/components/rounded_button.dart';
import 'package:fundmf/models/user.dart';
import 'package:fundmf/models/user_list.dart';
import 'package:fundmf/utils/constants.dart';
import 'package:fundmf/utils/helper.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:fundmf/utils/routes_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
  String name;
  String age;
  String gender;
  UserList userList = UserList();
  bool showSpinner = false;

  void showHideSpinner(spinner) {
    setState(() {
      showSpinner = spinner;
    });
  }

  void showAlert({message, error = false}) {
    AlertWidget alert = AlertWidget(
      title: error ? Text('Registration Error') : Text('Registration Success!'),
      messages: <Widget>[
        Text(message),
      ],
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
            if (!error) {
              LoggingHelper.logger.d('Rerouting');
              Routes().replace(context, Routes.home);
            }
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

  @override
  Widget build(BuildContext context) {
    return LoginScaffoldWidget(
      appBarTitle: 'Register',
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
                    height: 10.0,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Name',
                      focusedBorder: kBlueOutlineInputBorder,
                    ),
                    onChanged: (newValue) {
                      name = newValue;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Email-id',
                      focusedBorder: kBlueOutlineInputBorder,
                    ),
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
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Password',
                      focusedBorder: kBlueOutlineInputBorder,
                    ),
                    onChanged: (newValue) {
                      password = newValue;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FormField<String>(builder: (FormFieldState<String> state) {
                    return FormFieldWidget(
                      value: age,
                      hintText: 'Age',
                      listValues: Helper().getAgeValues(),
                      onChangedFn: (String newValue) {
                        setState(() {
                          age = newValue;
                          state.didChange(newValue);
                        });
                      },
                    );
                  }),
                  SizedBox(
                    height: 10.0,
                  ),
                  FormField<String>(builder: (FormFieldState<String> state) {
                    return FormFieldWidget(
                      value: gender,
                      hintText: 'Gender',
                      listValues: genderList,
                      onChangedFn: (String newValue) {
                        setState(() {
                          gender = newValue;
                          state.didChange(newValue);
                        });
                      },
                    );
                  }),
                  RoundedButton(
                    onPressed: () {
                      showHideSpinner(true);
                      try {
                        bool exists = false;
                        for (User r in userList.users) {
                          if (r.email == email) {
                            exists = true;
                          }
                        }

                        showHideSpinner(false);
                        if (!exists) {
                          User newUser = User(
                              name: name,
                              email: email,
                              password: password,
                              age: age,
                              gender: gender);
                          userList.register(newUser);
                          showAlert(
                              message:
                                  'Registration successful. Please login to start investing',
                              error: false);
                        } else {
                          showAlert(
                              message: 'User Already exists.', error: true);
                        }
                      } catch (ex, stack) {
                        showHideSpinner(false);
                        showAlert(
                            message:
                                'Error in registration. Please check your details',
                            error: true);
                      }
                    },
                    buttonColor: Colors.blueAccent,
                    buttonText: 'Register',
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
