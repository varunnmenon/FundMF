import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'mutual_fund.dart';

class MutualFundList extends ChangeNotifier {
  List<MutualFund> _mfList = [];
  List<MutualFund> _UnfilteresMfList = [];

  UnmodifiableListView<MutualFund> get mfList {
    return UnmodifiableListView(_mfList);
  }

  int get mfCount {
    return _mfList.length;
  }

  void sortSelf() {
    _mfList.sort((a, b) {
      return a
          .getSchemeName()
          .toLowerCase()
          .compareTo(b.getSchemeName().toLowerCase());
    });
  }

  void clearMFList() {
    _mfList.clear();
    notifyListeners();
  }

  void addMutualFund(MutualFund mf) {
    LoggingHelper.logger.d('Added Mutual fund ${mf.getSchemeName()}');
    _mfList.add(mf);
    sortSelf();
    notifyListeners();
  }

  void updateMFList(List<MutualFund> mList) {
    LoggingHelper.logger.d('Updates Mutual fund List');
    _mfList.clear();
    _mfList.addAll(mList);
    _UnfilteresMfList.addAll(mList);
    sortSelf();
  }

  void updateAndNotify(List<MutualFund> mList) {
    _mfList.clear();
    _mfList.addAll(mList);
    sortSelf();
    notifyListeners();
  }

  void searchMF(String s) {
    LoggingHelper.logger.d('Searching');
    if (s == null || s.isEmpty || s == '') {
      updateAndNotify(_UnfilteresMfList);
    } else {
      updateAndNotify(_UnfilteresMfList.where((element) =>
              element.getSchemeName().toLowerCase().contains(s.toLowerCase()))
          .toList());
    }
  }
}
