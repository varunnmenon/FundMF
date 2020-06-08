import 'package:fundmf/models/mutual_fund.dart';
import 'package:fundmf/models/mutual_fund_list.dart';
import 'package:fundmf/screens/mf_screen.dart';
import 'package:fundmf/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fundmf/utils/data_helper.dart';
import 'package:fundmf/utils/helper.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:fundmf/utils/time_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class MutualFundContainer extends StatefulWidget {
  @override
  _MutualFundContainerState createState() => _MutualFundContainerState();
}

class _MutualFundContainerState extends State<MutualFundContainer> {
  bool _showSpinner = false;
  var helperObj = Helper();

  Future<void> addToMFList() async {
    _showSpinner = true;
    List<MutualFund> mfL = await DataHelper.getLatestNAVData();
    Provider.of<MutualFundList>(context, listen: false).updateMFList(mfL);
    setState(() {
      _showSpinner = false;
    });
  }

  void addToHardcodedMFList() {
    _showSpinner = true;
    List<MutualFund> mfL = [];
    for (int i = 1; i <= 10; i++) {
      mfL.add(MutualFund(schemeName: 'MF$i', schemeNAV: '10$i'));
    }
    Provider.of<MutualFundList>(context, listen: false).updateMFList(mfL);
    _showSpinner = false;
  }

  String getPercentage(List<MutualFundHistoricData> historicData) {
    double latestNAV = historicData[0].getSchemeNAVForDate();
    double prevNAV = historicData[1].getSchemeNAVForDate();
    double sixMonthNAV = helperObj
        .getMonthsData(historicData: historicData, months: 6)
        .getSchemeNAVForDate();

    String returnPercent = helperObj.getNAVPercentage(latestNAV, prevNAV);
    String returnSixPercent =
        helperObj.getNAVPercentage(latestNAV, sixMonthNAV);

//    LoggingHelper.logger.d('Six month gain is $returnSixPercent');
    return returnSixPercent;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addToMFList();
  }

  Widget testCard(String mfName) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(15),
      child: Center(
        child: Text(
          mfName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mfL = Provider.of<MutualFundList>(context, listen: false);
    LoggingHelper.logger.d(mfL.mfCount);
    return Consumer<MutualFundList>(
      builder: (context, mfData, child) {
        return ModalProgressHUD(
          inAsyncCall: _showSpinner,
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.grey.shade300,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final mfDetails = mfData.mfList[index];
                return GestureDetector(
                  onTap: () {
                    LoggingHelper.logger.e('Card Tapped');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MutualFundScreen(
                          showMF: mfData.mfList[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: kMFCardMargin,
                    elevation: 6,
                    color: Colors.white,
//                      child: testCard(mfName),
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            width: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Hero(
                                  tag: 'MFLogo-${mfDetails.getSchemeCode()}',
                                  child: Center(
                                    child: Container(
                                      child: Image.asset(
                                          'lib/images/${helperObj.getLogoUrl(mfDetails.getSchemeName())}.png'),
                                      height: 50,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              width: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    mfDetails.getSchemeName(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    mfDetails.getSchemeCode(),
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    '${helperObj.getPercentage(historicData: mfDetails.getSchemeHistoricData(), months: 6, isAllTime: false, oneDay: false)}%',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    '6M',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: mfData.mfCount,
            ),
          ),
        );
      },
    );
  }
}
