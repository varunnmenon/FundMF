import 'package:fundmf/utils/constants.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future getData(
      {String schemeCode, String prevNAVDate, RequestType requestType}) async {
    String url = setGetURL(schemeCode, prevNAVDate, requestType);
    http.Response response = await http.get(url,
        headers: requestType == RequestType.HistoricData
            ? Map<String, String>()
            : mfHeaders);

    if (response.statusCode == 200) {
      print('gotData');
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
    }
  }

  String setGetURL(
      String schemeCode, String prevNAVDate, RequestType requestType) {
    String url = 'https://latest-mutual-fund-nav.p.rapidapi.com/';

    if (requestType == RequestType.Mutualfunds) {
      url = url + 'fetchLatestNAV?SchemeType=Open%20Ended%20Schemes';
    } else if (requestType == RequestType.YesterdayData) {
      url = url +
          'fetchHistoricalNAV?SchemeCode=$schemeCode&SchemeType=Open%20Ended%20Schemes&Date=$prevNAVDate';
    } else {
      url = 'https://api.mfapi.in/mf/$schemeCode';
    }

    return url;
  }
}
