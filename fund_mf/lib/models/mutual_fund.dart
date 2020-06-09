import 'package:fundmf/utils/time_helper.dart';

class MutualFund {
  String _mutualFundFamily,
      _schemeCategory,
      _schemeName,
      _latestDate,
      _schemeNAV,
      _schemeCode,
      _schemeType;

//  String _schemePrevDate;
  String _schemePrevNAV = '0';
  List<MutualFundHistoricData> _schemeHistoricData = [];

  MutualFund(
      {mutualFundFamily,
      schemeCategory,
      schemeName,
      latestDate,
      schemeNAV,
      schemeCode,
//    schemePrevDate,
      schemeType}) {
    this._mutualFundFamily = mutualFundFamily;
    this._schemeCategory = schemeCategory;
    this._schemeName = schemeName;
    this._latestDate = latestDate;
    this._schemeNAV = schemeNAV;
    this._schemeCode = schemeCode;
    this._schemeType = schemeType;
//    this._schemePrevDate = schemePrevDate;
  }

  factory MutualFund.fromJson(dynamic json) {
    return MutualFund(
        mutualFundFamily: json['Mutual Fund Family'] as String,
        schemeCategory: json['Scheme Category'] as String,
        schemeName: json['Scheme Name'] as String,
        latestDate: json['Date'] as String,
        schemeNAV: json['Net Asset Value'] as String,
        schemeCode: json['Scheme Code'] as String,
        schemeType: json['Scheme Type'] as String);
//        schemePrevDate: DateTimeHelper.subtractDaysToDate(
//            latestNAVDate: json['Date'] as String, daysToSubtract: 1));
  }

  String getSchemeName() {
    return _schemeName;
  }

  String getNAVStr() {
    return _schemeNAV;
  }

  double getNAV() {
    return double.parse(_schemeNAV);
  }

  String getDate() {
    return _latestDate;
  }

//  String getPrevDate() {
//    return _schemePrevDate;
//  }

  String getSchemeCode() {
    return _schemeCode;
  }

  String getMutualFundFamily() {
    return _mutualFundFamily;
  }

  String getSchemeCategory() {
    return _schemeCategory;
  }

  String getSchemeType() {
    return _schemeType;
  }

  void setPrevNAV(String newValue) {
    _schemePrevNAV = newValue;
  }

  String getPrevNAV() {
    return _schemePrevNAV;
  }

  void setSchemeHistoricData(List<MutualFundHistoricData> schemeHistoricData) {
    _schemeHistoricData = schemeHistoricData;
  }

  List<MutualFundHistoricData> getSchemeHistoricData() {
    return _schemeHistoricData;
  }

  List<MutualFundHistoricData> getReversedSchemeHistoricData() {
    return _schemeHistoricData.reversed.toList();
  }
}

class MutualFundHistoricData {
  String _schemeNAVForDate, _schemeDate;

  MutualFundHistoricData({schemeNAVForDate, schemeDate}) {
    this._schemeNAVForDate = schemeNAVForDate;
    this._schemeDate = schemeDate;
  }

  factory MutualFundHistoricData.fromJson(dynamic json) {
    return MutualFundHistoricData(
        schemeNAVForDate: json['nav'] as String,
        schemeDate: json['date'] as String);
  }

  String getSchemeNAVForDateStr() {
    return _schemeNAVForDate;
  }

  double getSchemeNAVForDate() {
    return double.parse(_schemeNAVForDate);
  }

  String getSchemeDate() {
    return _schemeDate;
  }
}
