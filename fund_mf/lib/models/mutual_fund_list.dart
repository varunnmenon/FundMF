import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'mutual_fund.dart';

class MutualFundList extends ChangeNotifier {
  List<MutualFund> _mfList = [];

  UnmodifiableListView<MutualFund> get mfList {
    return UnmodifiableListView(_mfList);
  }

  int get mfCount {
    return _mfList.length;
  }

  void sortSelf() {
    _mfList.sort((a, b) {
      return a.getName().toLowerCase().compareTo(b.getName().toLowerCase());
    });
  }

  void clearMFList() {
    _mfList.clear();
    notifyListeners();
  }

  void addMutualFund(MutualFund mf) {
    LoggingHelper.logger.d('Added Mutual fund ${mf.getName()}');
    _mfList.add(mf);
    sortSelf();
    notifyListeners();
  }

  void updateMFList(List<MutualFund> mList) {
    LoggingHelper.logger.d('Updates Mutual fund List');
    _mfList.clear();
    _mfList.addAll(mList);
    sortSelf();
  }

  void updateAndNotify(List<MutualFund> mList) {
    updateMFList(mList);
    notifyListeners();
  }
}
