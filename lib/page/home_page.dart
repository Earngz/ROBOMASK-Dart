import 'package:robomask/page/insight_page.dart';
import 'package:robomask/page/market_page.dart';
import 'package:robomask/page/wallet_page.dart';
import 'package:robomask/theme/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

//appbar
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 1;
  List<Widget> pagelist = [MarketPage(), WalletPage(), InsightPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagelist[pageIndex],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kBgPurpleColor,
        unselectedItemColor: kbtnunselectColor,
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                UniconsLine.chart,
                size: 35,
              ),
              label: 'Market'),
          BottomNavigationBarItem(
              icon: Icon(
                UniconsLine.wallet,
                size: 35,
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.timeline_rounded,
                size: 35,
              ),
              label: 'Insight'),
        ],
      ),
    );
  }
}
