import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fundmf/components/app_scaffold_widget.dart';
import 'package:fundmf/components/mf_details_widget.dart';
import 'package:fundmf/components/table_nav_widget.dart';
import 'package:fundmf/models/mutual_fund.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fundmf/utils/helper.dart';

class MutualFundScreen extends StatefulWidget {
  final MutualFund showMF;
  MutualFundScreen({this.showMF});

  @override
  _MutualFundScreenState createState() => _MutualFundScreenState();
}

class _MutualFundScreenState extends State<MutualFundScreen> {
  bool showSpinner = false;
  Helper helperObj = Helper();

  void testScreen() {
    Container(
      color: Colors.white,
    );
  }

  void BKUPScreen() {
    Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Hero(
                      tag: 'MFLogo-${widget.showMF.getSchemeCode()}',
                      child: Center(
                        child: Container(
                          child: Image.asset(
                              'lib/images/${helperObj.getLogoUrl(widget.showMF.getSchemeName())}.png'),
                          height: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          widget.showMF.getSchemeName(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            '9.999%',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            '0.85% 1-Day Return',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBarTitle: '',
      isBottomBarVisible: false,
      isPage: true,
      actions: <Widget>[],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Card(
                elevation: 4,
                margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                color: Colors.white,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: Scrollbar(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Container(
                                              height: 80,
                                              width: 100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Container(
                                                    width: 50,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Hero(
                                                          tag:
                                                              'MFLogo-${widget.showMF.getSchemeCode()}',
                                                          child: Center(
                                                            child: Container(
                                                              child: Image.asset(
                                                                  'lib/images/${helperObj.getLogoUrl(widget.showMF.getSchemeName())}.png'),
                                                              height: 50,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                        widget.showMF
                                                            .getSchemeName(),
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Returns :',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Container(
                                              height: 1,
                                              padding:
                                                  EdgeInsets.only(right: 40),
                                              color: Colors.grey.shade600,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: 100,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  TableNAVWidget(
                                                    isHead: true,
                                                    allTimeStr: 'All',
                                                    fundReturnStr: '',
                                                    oneYStr: '1Y',
                                                    threeMStr: '3M',
                                                    threeYStr: '3Y',
                                                  ),
                                                  TableNAVWidget(
                                                    isHead: false,
                                                    allTimeStr:
//                                                      '1%',
                                                        '${helperObj.getPercentage(historicData: widget.showMF.getSchemeHistoricData(), months: 0, isAllTime: true, oneDay: false)}%',
                                                    fundReturnStr:
                                                        'Fund Returns',
                                                    oneYStr:
                                                        '${helperObj.getPercentage(historicData: widget.showMF.getSchemeHistoricData(), months: 12, isAllTime: false, oneDay: false)}%',
//                                                  threeMStr: '1',
                                                    threeMStr:
                                                        '${helperObj.getPercentage(historicData: widget.showMF.getSchemeHistoricData(), months: 3, isAllTime: false, oneDay: false)}%',
                                                    threeYStr:
                                                        '${helperObj.getPercentage(historicData: widget.showMF.getSchemeHistoricData(), months: 36, isAllTime: false, oneDay: false)}%',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Container(
                                              width: 100,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Scheme Details :',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    padding: EdgeInsets.only(
                                                        right: 40),
                                                    color: Colors.grey.shade600,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  MFDetailWidget(
                                                    heading: 'Latest NAV :',
                                                    value:
                                                        '\u{20B9} ${widget.showMF.getNAV().toStringAsFixed(2)} (as on ${widget.showMF.getDate()})',
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  MFDetailWidget(
                                                    heading: '1D Returns :',
                                                    value:
                                                        '${helperObj.getPercentage(historicData: widget.showMF.getSchemeHistoricData(), months: 0, isAllTime: false, oneDay: true)}%',
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  MFDetailWidget(
                                                    heading: 'Scheme Code :',
                                                    value:
                                                        '${widget.showMF.getSchemeCode()}',
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  MFDetailWidget(
                                                    heading:
                                                        'Scheme Category :',
                                                    value:
                                                        '${widget.showMF.getSchemeCategory()}',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
