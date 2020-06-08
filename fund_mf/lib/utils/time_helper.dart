import 'package:flutter/cupertino.dart';
import 'package:fundmf/utils/constants.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static int getDateDifference({String date1Str, String date2Str}) {
    var date1 = convertToDateTime(dateNAV: date1Str);
    var date2 = convertToDateTime(dateNAV: date2Str);
    return date1.difference(date2).inDays;
  }

  static String addSubDaysToDate(
      {String latestNAVDate,
      int daysToAddSubtract = 0,
      int monthToAddSubtract = 0,
      @required DateModificationType addSubtract}) {
    var date1 = convertToDateTime(dateNAV: latestNAVDate);
//    date1 = addSubtract == DateModificationType.subtract
//        ? date1.subtract(Duration(days: daysToAddSubtract))
//        : date1.add(Duration(days: daysToAddSubtract));

    var date2 = addSubtract == DateModificationType.subtract
        ? new DateTime(date1.year, date1.month - monthToAddSubtract,
            date1.day - daysToAddSubtract)
        : new DateTime(date1.year, date1.month + monthToAddSubtract,
            date1.day + daysToAddSubtract);

    return _convertFromDateTime(dateNAV: date2);
  }

  static String _addDaysToDate({String dateNAV, int daysToADD = 1}) {
    var date1 = convertToDateTime(dateNAV: dateNAV);
    date1.add(Duration(days: daysToADD));
    return _convertFromDateTime(dateNAV: date1);
  }

  static String _subtractDaysToDate({String dateNAV, int daysToSubtract = 1}) {
    var date1 = convertToDateTime(dateNAV: dateNAV);
    date1.add(Duration(days: daysToSubtract));
    return _convertFromDateTime(dateNAV: date1);
  }

  static DateTime convertToDateTime(
      {String dateNAV, String format = "dd-MM-yyyy"}) {
    var inputFormat = DateFormat(format);
    return inputFormat.parse(dateNAV);
  }

  static String _convertFromDateTime(
      {DateTime dateNAV, String dateFormatStr = "dd-MM-yyyy"}) {
    var inputFormat = DateFormat(dateFormatStr);
    String formattedDate = inputFormat.format(dateNAV);
    return formattedDate;
  }
}
