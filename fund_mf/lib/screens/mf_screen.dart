import 'package:flutter/material.dart';
import 'package:fundmf/components/app_scaffold_widget.dart';
import 'package:fundmf/components/mf_details_widget.dart';
import 'package:fundmf/components/table_nav_widget.dart';
import 'package:fundmf/models/mutual_fund.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fundmf/utils/helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MutualFundScreen extends StatefulWidget {
  final MutualFund showMF;
  MutualFundScreen({this.showMF});

  @override
  _MutualFundScreenState createState() => _MutualFundScreenState();
}

class _MutualFundScreenState extends State<MutualFundScreen> {
  bool showSpinner = false;
  Helper helperObj = Helper();

  @override
  Widget build(BuildContext context) {
    final oneDayPercent = helperObj.getPercentage(
        historicData: widget.showMF.getSchemeHistoricData(),
        months: 0,
        isAllTime: false,
        oneDay: true);
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
                                  left: 20, right: 20, top: 30, bottom: 40),
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
                                            SfCartesianChart(
                                              primaryXAxis: CategoryAxis(),
                                              // Chart title
                                              title: ChartTitle(
                                                  text:
                                                      'Datewise Movement on NAV'),
                                              // Enable legend
//                                              legend: Legend(isVisible: true),
                                              // Enable tooltip
                                              tooltipBehavior:
                                                  TooltipBehavior(enable: true),
                                              series: <ChartSeries>[
                                                FastLineSeries<
                                                    MutualFundHistoricData,
                                                    String>(
                                                  color: Colors.teal,
                                                  dataSource: widget.showMF
                                                      .getReversedSchemeHistoricData(),
                                                  xValueMapper:
                                                      (MutualFundHistoricData d,
                                                              _) =>
                                                          d.getSchemeDate(),
                                                  yValueMapper:
                                                      (MutualFundHistoricData d,
                                                              _) =>
                                                          double.parse(d
                                                              .getSchemeNAVForDate()
                                                              .toStringAsFixed(
                                                                  2)),
                                                  // Enable data label
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: false),
                                                )
                                              ],
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
                                                    valueColor: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  MFDetailWidget(
                                                    heading: '1D Returns :',
                                                    value: '$oneDayPercent%',
                                                    valueColor: oneDayPercent
                                                            .contains('-')
                                                        ? Colors.redAccent
                                                        : Colors.green,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  MFDetailWidget(
                                                    heading: 'Scheme Code :',
                                                    value:
                                                        '${widget.showMF.getSchemeCode()}',
                                                    valueColor: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  MFDetailWidget(
                                                    heading:
                                                        'Scheme Category :',
                                                    value:
                                                        '${widget.showMF.getSchemeCategory()}',
                                                    valueColor: Colors.black,
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
