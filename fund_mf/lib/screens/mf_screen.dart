import 'package:flutter/material.dart';
import 'package:fundmf/components/app_scaffold_widget.dart';
import 'package:fundmf/models/mutual_fund.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MutualFundScreen extends StatefulWidget {
  final MutualFund showMF;
  MutualFundScreen({this.showMF});

  @override
  _MutualFundScreenState createState() => _MutualFundScreenState();
}

class _MutualFundScreenState extends State<MutualFundScreen> {
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBarTitle: widget.showMF.getName(),
      isBottomBarVisible: true,
      isPage: true,
      actions: <Widget>[],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          color: Colors.teal,
        ),
      ),
    );
  }
}
