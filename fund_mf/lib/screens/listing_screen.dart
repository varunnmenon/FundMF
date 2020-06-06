import 'package:flutter/material.dart';
import 'package:fundmf/components/app_scaffold_widget.dart';
import 'package:fundmf/components/mf_list_container.dart';
import 'package:fundmf/models/mutual_fund_list.dart';
import 'package:fundmf/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget mfScreen() {
    return MutualFundContainer();
  }

  Widget accountScreen() {
    return ProfileScreen();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MutualFundList>(
      create: (context) => MutualFundList(),
      child: AppScaffoldWidget(
        isBottomBarVisible: true,
        actions: [],
        isPage: false,
        appBarTitle: 'Mutual Funds',
        body: TabBarView(
          children: [
            mfScreen(),
            accountScreen(),
          ],
        ),
      ),
    );
  }
}
