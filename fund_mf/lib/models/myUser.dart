import 'user.dart';

class MyUser {
  static MyUser _loggedUser = new MyUser._internal();

  factory MyUser() {
    return _loggedUser;
  }

  User _user;
  User get user => _user;

  MyUser._internal();

  void login(User newValue) {
    _user = newValue;
  }

  void logOut() {
    _user = null;
  }
}
