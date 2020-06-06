import 'package:fundmf/models/mutual_fund.dart';
import 'package:fundmf/models/mutual_fund_list.dart';
import 'package:fundmf/screens/mf_screen.dart';
import 'package:fundmf/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fundmf/utils/log_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class MutualFundContainer extends StatefulWidget {
  @override
  _MutualFundContainerState createState() => _MutualFundContainerState();
}

class _MutualFundContainerState extends State<MutualFundContainer> {
  bool _showSpinner = false;

  void addToMFList() {
    _showSpinner = true;
    List<MutualFund> mfL = [];
    for (int i = 1; i <= 10; i++) {
      mfL.add(MutualFund(name: 'MF$i', cost: '10$i'));
    }
    Provider.of<MutualFundList>(context, listen: false).updateMFList(mfL);
    _showSpinner = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addToMFList();
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
                final mfName = mfData.mfList[index].getName();
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
                  child: Hero(
                    tag: mfName,
                    child: Card(
                      margin: kMFCardMargin,
                      elevation: 6,
                      color: Colors.white,
                      child: Container(
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
