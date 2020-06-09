import 'package:fundmf/models/mutual_fund.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:fundmf/utils/time_helper.dart';
import 'constants.dart';

class Helper {
  String capitalize(String input) {
    if (input == null) {
      throw new ArgumentError("string: $input");
    }
    if (input.length == 0) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  String getInitials(String input) {
    if (input == null) {
      throw new ArgumentError("string: $input");
    }
    if (input.length == 0) {
      return input;
    }
    var inpArr = input.split(' ');
    String initials = '';
    for (var word in inpArr) {
      LoggingHelper.logger.d('word is $word');
      if (word.length > 0) {
        initials += capitalize(word[0]);
      }
    }
    return initials;
  }

  String getLogoUrl(String schemeName) {
    String schemeNameStr = schemeName.toLowerCase();
    if (schemeNameStr.contains('axis')) {
      return 'axis';
    } else if (schemeNameStr.contains('birla')) {
      return 'birla';
    } else if (schemeNameStr.contains('dsp')) {
      return 'dsp';
    } else if (schemeNameStr.contains('edelweiss')) {
      return 'edelweiss';
    } else if (schemeNameStr.contains('franklin')) {
      return 'franklin';
    } else if (schemeNameStr.contains('icici')) {
      return 'icici';
    } else if (schemeNameStr.contains('idfc')) {
      return 'idfc';
    } else if (schemeNameStr.contains('indiabulls')) {
      return 'indiabulls';
    } else if (schemeNameStr.contains('invesco')) {
      return 'invesco';
    } else if (schemeNameStr.contains('kotak')) {
      return 'kotak';
    } else if (schemeNameStr.contains('l&t')) {
      return 'l&t';
    } else if (schemeNameStr.contains('lic')) {
      return 'lic';
    } else if (schemeNameStr.contains('nippon')) {
      return 'nippon';
    } else if (schemeNameStr.contains('uti')) {
      return 'uti';
    } else if (schemeNameStr.contains('motilal')) {
      return 'motilal';
    } else if (schemeNameStr.contains('canara')) {
      return 'canara';
    } else if (schemeNameStr.contains('tata')) {
      return 'tata';
    }

    return 'Logo';
  }

  MutualFundHistoricData getMonthsData(
      {List<MutualFundHistoricData> historicData, int months}) {
    String sixMonthPrevDate = DateTimeHelper.addSubDaysToDate(
        addSubtract: DateModificationType.subtract,
        monthToAddSubtract: months,
        latestNAVDate: historicData[0].getSchemeDate(),
        daysToAddSubtract: 0);

    var oldDate = DateTimeHelper.convertToDateTime(
        dateNAV: historicData.last.getSchemeDate());
    var latestDate = DateTimeHelper.convertToDateTime(
        dateNAV: historicData[0].getSchemeDate());

    int monthsDiff = 0;

    if (latestDate.year - oldDate.year > 0) {
      monthsDiff = (latestDate.year - oldDate.year) * 12;
      if (latestDate.month - oldDate.month < 0) {
        monthsDiff = monthsDiff - 1;
      } else if (latestDate.month - oldDate.month == 0) {
        if (latestDate.day - oldDate.day <= 0) {
          monthsDiff = monthsDiff - 1;
        }
      }
    }

    var sixMonthData = historicData;
    if (months <= monthsDiff) {
      sixMonthData =
          getHistoricDataForComputation(historicData, sixMonthPrevDate);
    }

    return sixMonthData.first;
  }

  List<MutualFundHistoricData> getHistoricDataForComputation(
      List<MutualFundHistoricData> historicData, String sixMonthPrevDate) {
    var sixMonthData = historicData
        .where((i) => i.getSchemeDate() == sixMonthPrevDate)
        .toList();
    if (sixMonthData.length == 0) {
      while (true) {
        sixMonthPrevDate = DateTimeHelper.addSubDaysToDate(
            addSubtract: DateModificationType.add,
            latestNAVDate: sixMonthPrevDate,
            daysToAddSubtract: 1);
        sixMonthData = historicData
            .where((i) => i.getSchemeDate() == sixMonthPrevDate)
            .toList();
        if (sixMonthData.length > 0) {
          break;
        }
      }
    }

    return sixMonthData;
  }

  String getPercentage(
      {List<MutualFundHistoricData> historicData,
      bool oneDay,
      bool isAllTime,
      int months}) {
    double latestNAV = historicData[0].getSchemeNAVForDate();
    double selectedMonthNAV = oneDay
        ? historicData[1].getSchemeNAVForDate()
        : (isAllTime
            ? historicData.last.getSchemeNAVForDate()
            : getMonthsData(historicData: historicData, months: months)
                .getSchemeNAVForDate());

    String returnSelectedPercent =
        getNAVPercentage(latestNAV, selectedMonthNAV);

    return returnSelectedPercent;
  }

  String getNAVPercentage(double latestNAV, double prevNAV) {
    String returnPercent = '0';
    try {
      double diffNAV = (latestNAV - prevNAV) / prevNAV;
      diffNAV = diffNAV * 100.0;
      returnPercent = diffNAV.toStringAsFixed(3);
    } catch (ex) {
      LoggingHelper.logger.e(ex);
    }
    return returnPercent;
  }

  List<String> getAgeValues() {
    List<String> ages = [];
    for (var i = 18; i < 100; i++) {
      ages.add(i.toString());
    }
    return ages;
  }
}
