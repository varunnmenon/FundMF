import 'package:flutter/material.dart';

class LoginScaffoldWidget extends StatefulWidget {
  final Widget body;
  final String appBarTitle;
  final List<Widget> actions;

  LoginScaffoldWidget({Key key, this.body, this.appBarTitle, this.actions})
      : super(key: key);

  @override
  _LoginScaffoldWidget createState() => _LoginScaffoldWidget();
}

class _LoginScaffoldWidget extends State<LoginScaffoldWidget> {
  String titleText = 'FundMF';
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final topBar = AppBar(
      brightness: Brightness.light,
      title: Text(
        widget.appBarTitle,
        style: TextStyle(
          color: Colors.black,
          fontSize: 23,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actions: widget.actions,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topBar,
      body: widget.body,
    );
  }
}
