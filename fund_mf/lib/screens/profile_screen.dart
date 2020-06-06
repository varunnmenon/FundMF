import 'package:flutter/material.dart';
import 'package:fundmf/components/alert_widget.dart';
import 'package:fundmf/components/app_scaffold_widget.dart';
import 'package:fundmf/components/form_field_widget.dart';
import 'package:fundmf/components/rounded_button.dart';
import 'package:fundmf/models/myUser.dart';
import 'package:fundmf/models/user.dart';
import 'package:fundmf/models/user_list.dart';
import 'package:fundmf/utils/constants.dart';
import 'package:fundmf/utils/helper.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:fundmf/utils/routes_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:package_info/package_info.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showSpinner = false;
  bool _isUpdate = false;
  String userName = 'Name';
  String email;
  String password;
  String name;
  String age;
  String gender;
  UserList userList = UserList();

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  void showHideSpinner(spinner) {
    setState(() {
      _showSpinner = spinner;
    });
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  void getName() {
    LoggingHelper.logger.d('getName Called');
    setState(() {
      showHideSpinner(true);
      userName = MyUser().user.name;
      showHideSpinner(false);
    });
  }

  void setInitialValues() {
    _nameController = new TextEditingController(text: MyUser().user.name);
    _emailController = new TextEditingController(text: MyUser().user.email);
    _passwordController =
        new TextEditingController(text: MyUser().user.password);
    age = MyUser().user.age;
    gender = MyUser().user.gender;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
    _initPackageInfo();
    setInitialValues();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  void showAlert({message, error = false}) {
    AlertWidget alert = AlertWidget(
      title: error ? Text('Error in Saving User details') : Text('Success!'),
      messages: <Widget>[
        Text(message),
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

  List<String> getAgeValues() {
    List<String> ages = [];
    for (var i = 18; i < 100; i++) {
      ages.add(i.toString());
    }
    return ages;
  }

  Widget viewProfile() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 20),
      color: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              Helper().capitalize(userName),
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              MyUser().user.email,
              style: TextStyle(fontSize: 17),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '${MyUser().user.age}, ${Helper().capitalize(MyUser().user.gender)}',
              style: TextStyle(fontSize: 17),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: RoundedButton(
              onPressed: () {
                LoggingHelper.logger.d('Edit profile pressed');
                try {
                  setState(() {
                    _isUpdate = true;
                  });
                } catch (e) {
                  LoggingHelper.logger.e(e);
                }
              },
              buttonColor: Colors.teal,
              buttonText: 'Edit Profile',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: RoundedButton(
              onPressed: () {
                LoggingHelper.logger.d('Logout pressed');
                try {
                  MyUser().logOut();
                  Routes().replace(context, Routes.home);
                } catch (e) {
                  LoggingHelper.logger.e(e);
                }
              },
              buttonColor: Colors.blueAccent,
              buttonText: 'Logout',
            ),
          ),
          Center(
            child: Text(
              'App Version: v${_packageInfo.version} (${_packageInfo.buildNumber})'
                  .toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }

  Widget editProfile() {
    return SizedBox.expand(
      child: Container(
        color: Colors.grey.shade300,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Please input new values for your profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: _nameController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Name',
                  focusedBorder: kBlueOutlineInputBorder,
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (newValue) {
                  name = newValue;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _emailController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Email-id',
                  focusedBorder: kBlueOutlineInputBorder,
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (newValue) {
                  email = newValue;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Password',
                  focusedBorder: kBlueOutlineInputBorder,
                  fillColor: Colors.white,
                  filled: true,
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
                  listValues: getAgeValues(),
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
                  listValues: <String>['Male', 'Female', 'Others'],
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
                    for (User r in userList.users) {
                      if (r.email == MyUser().user.email) {
                        r.name = name;
                        r.email = email;
                        r.password = password;
                        r.age = age;
                        r.gender = gender;

                        setState(() {
                          MyUser().login(r);
                        });
                      }
                    }
                    showHideSpinner(false);
                    setState(() {
                      _isUpdate = false;
                    });
                    showAlert(
                        message: 'Successfully updated user details.',
                        error: false);
                  } catch (ex, stack) {
                    showHideSpinner(false);
                    showAlert(
                        message:
                            'Error in Updating user details. Please check your details',
                        error: true);
                  }
                },
                buttonColor: Colors.teal,
                buttonText: 'Update Details',
              ),
              RoundedButton(
                onPressed: () {
                  setState(() {
                    _isUpdate = false;
                  });
                },
                buttonColor: Colors.blueAccent,
                buttonText: 'Cancel',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: _isUpdate ? editProfile() : viewProfile(),
    );
  }
}
