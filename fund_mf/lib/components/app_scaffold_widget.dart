import 'package:flutter/material.dart';
import 'package:fundmf/models/myUser.dart';

class AppScaffoldWidget extends StatefulWidget {
  final Widget body;
  final String appBarTitle;
  final List<Widget> actions;
  final bool isBottomBarVisible;
  final bool isPage;

  AppScaffoldWidget(
      {Key key,
      this.body,
      this.appBarTitle,
      this.actions,
      this.isPage,
      this.isBottomBarVisible})
      : super(key: key);

  @override
  _AppScaffoldWidgetState createState() => _AppScaffoldWidgetState();
}

class _AppScaffoldWidgetState extends State<AppScaffoldWidget> {
  String titleText = 'FundMF';
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final topBar = AppBar(
      brightness: Brightness.light,
      title: Text(
        widget.isPage ? widget.appBarTitle : titleText,
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

    final bottomBar = Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 20),
      child: TabBar(
        labelColor: Colors.teal,
        labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        indicatorColor: Colors.teal,
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        onTap: (index) {
          setState(() {
            if (index == 0) {
              titleText = 'Fund MF';
            } else {
              titleText = MyUser().user.name;
            }
            tabIndex = index;
          });
        },
        tabs: [
          Tab(
            text: 'Listing',
            icon: Icon(Icons.home),
            iconMargin: EdgeInsets.only(bottom: 0),
          ),
          Tab(
            text: 'Account',
            icon: Icon(Icons.account_circle),
            iconMargin: EdgeInsets.only(bottom: 0),
          ),
        ],
      ),
    );

    return DefaultTabController(
      length: 2,
      initialIndex: tabIndex,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: topBar,
        bottomNavigationBar: widget.isBottomBarVisible ? bottomBar : null,
        body: widget.body,
      ),
    );
  }
}
