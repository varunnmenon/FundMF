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

    var date2 = addSubtract == DateModificationType.subtract
        ? new DateTime(date1.year, date1.month - monthToAddSubtract,
            date1.day - daysToAddSubtract)
        : new DateTime(date1.year, date1.month + monthToAddSubtract,
            date1.day + daysToAddSubtract);

    return _convertFromDateTime(dateNAV: date2);
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
