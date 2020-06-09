import 'dart:convert';
import 'package:fundmf/models/mutual_fund.dart';
import 'package:fundmf/utils/constants.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:fundmf/utils/network_helper.dart';

class DataHelper {
  static Future getLatestNAVData() async {
    String returnData = await NetworkHelper().getData(
        schemeCode: '', requestType: RequestType.Mutualfunds, prevNAVDate: '');

    LoggingHelper.logger.d(returnData);
    List<MutualFund> unfilteredMfs = getListFromString(returnData);
    List<MutualFund> mfs = unfilteredMfs
        .where((i) => i.getDate().contains('2020'))
        .toList()
        .sublist(0, 21);
    for (MutualFund m in mfs) {
      m.setSchemeHistoricData(await getHistoricNAVData(m.getSchemeCode()));
    }

    return mfs;
  }

  static Future getHistoricNAVData(String schemeCode) async {
    String returnData = await NetworkHelper().getData(
        schemeCode: schemeCode,
        requestType: RequestType.HistoricData,
        prevNAVDate: '');

    LoggingHelper.logger.d(returnData);

    var mfsHistoricJson = jsonDecode(returnData)['data'] as List;
    List<MutualFundHistoricData> mfs = mfsHistoricJson
        .map((mfJson) => MutualFundHistoricData.fromJson(mfJson))
        .toList();
    LoggingHelper.logger.d(mfs.length);

    return mfs;
  }

  static List<MutualFund> getListFromString(String jsonData) {
    var mfsJson = jsonDecode(jsonData) as List;
    List<MutualFund> mfs =
        mfsJson.map((mfJson) => MutualFund.fromJson(mfJson)).toList();
    LoggingHelper.logger.d(mfs.length);

    return mfs;
  }
}
