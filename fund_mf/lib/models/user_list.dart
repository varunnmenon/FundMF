import 'dart:collection';
import 'package:fundmf/utils/log_helper.dart';

import 'user.dart';

class UserList {
  static UserList _userList = new UserList._internal();
  factory UserList() {
    return _userList;
  }
  UserList._internal();

  List<User> _users = [];

  UnmodifiableListView<User> get users {
    return UnmodifiableListView(_users);
  }

  void register(User user) {
    _users.add(user);
    LoggingHelper.logger.d('User Added');
  }
}
