import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:intl/intl.dart';
import 'package:robomask/data.dart';
import 'package:robomask/page/market_page.dart';
import 'package:robomask/theme/app_color.dart';
import 'package:robomask/theme/app_size.dart';
import 'package:robomask/theme/app_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unicons/unicons.dart';

//Contact Us drawer
class ContactUsItem extends StatelessWidget {
  const ContactUsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: kBtnColor, size: 10),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Positioned(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              image: DecorationImage(
                image: AssetImage('assets/images/bgwallet.png'),
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.35),
            height: size.height,
            decoration: BoxDecoration(
                color: kCardBGColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
        ),
        Positioned(
          top: 88,
          left: 54,
          child: Image.asset('assets/images/happy-robo.png'),
          width: size.width * 0.72,
        ),
        Positioned(
          top: 326,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 45),
                child: Text(
                  'Contact Us',
                  style: kTitleTextStyle,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50, top: 15),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kBgPurpleColor, shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(
                        UniconsLine.location_point,
                        size: 30,
                        color: kBackgroundColor,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => WebLocation()));
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 300,
                    child: Text(
                      'Assumption University, Suvarnabhumi',
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 450,
          left: 25,
          right: 25,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(children: [
              Column(
                children: [
                  InputBoxWidget(
                    icon: UniconsLine.user,
                    text: 'Name',
                  ),
                  InputBoxWidget(
                    icon: UniconsLine.message,
                    text: 'Email',
                  ),
                  InputBoxWidget(
                    icon: UniconsLine.phone,
                    text: 'Phone',
                  ),
                ],
              ),
            ]),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomSubmitAlert();
                });
          },
          child: Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 81, top: 700),
              child: Container(
                width: 214,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: kBtnShadow,
                    color: kBtnColor),
                child: Center(
                  child: Text('Submit', style: kBtnTextStyle),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class InputBoxWidget extends StatelessWidget {
  const InputBoxWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: TextStyle(color: kSubtitleColor, fontSize: 17),
          prefixIcon: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: kBgPurpleColor,
              )),
        ),
      ),
    );
  }
}

class CustomSubmitAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Stack(
          // ignore: deprecated_member_use
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 300,
              width: 325,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'Success!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      width: 300,
                      child: Text(
                        'Your requested has been successfully sent.',
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kBtnColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(color: kBtnTxtColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: kBgPurpleColor,
                  radius: 60,
                  child: Icon(
                    Icons.done_sharp,
                    color: Colors.white,
                    size: 45,
                  ),
                )),
          ],
        ));
  }
}

class WebLocation extends StatefulWidget {
  WebLocation({Key? key}) : super(key: key);

  @override
  _WebLocationState createState() => _WebLocationState();
}

class _WebLocationState extends State<WebLocation> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url:
          'https://www.google.com/maps/place/%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%97%E0%B8%A2%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2%E0%B8%AD%E0%B8%B1%E0%B8%AA%E0%B8%AA%E0%B8%B1%E0%B8%A1%E0%B8%8A%E0%B8%B1%E0%B8%8D/@13.6125003,100.8336537,19z/data=!4m5!3m4!1s0x311d430e775155f9:0xf01923824353260!8m2!3d13.6119216!4d100.8377736',
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: kBtnColor, size: 10),
        title: Text(
          'RoboMask',
          style: TextStyle(color: kBtnColor),
        ),
        centerTitle: true,
      ),
    );
  }
}


//Setting Drawer
class SettingItem extends StatelessWidget {
  const SettingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(color: kBtnColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: kBtnColor, size: 10),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          Column(
            children: [
              SettingCard(
                title: 'General',
                subtitle:
                    'Currency conversion, primary currency and search engine',
              ),
              Divider(),
              SettingCard(
                title: 'Security & Privacy',
                subtitle:
                    'Privacy setting, MetaMetrics, private key and wallet Secret Recovery Phrase',
              ),
              Divider(),
              SettingCard(
                title: 'Advance',
                subtitle:
                    'Access developer feature, reset account, setup testnets, sync with the extension, state logs',
              ),
              Divider(),
              SettingCard(
                title: 'Contact',
                subtitle: 'Add, edit, romove, and manage your accounts',
              ),
              Divider(),
              SettingCard(
                title: 'Networks',
                subtitle: 'Add and edit custom RPC networks',
              ),
              Divider(),
              SettingCard(
                title: 'Experimental',
                subtitle: 'WalletConnect & more...',
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  const SettingCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(title, style: kSubTextStyle),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Text(subtitle, style: kSubTitleTextStyle),
              ),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


//Get help Drawer
class WebHelp extends StatefulWidget {
  WebHelp({Key? key}) : super(key: key);

  @override
  _WebHelpState createState() => _WebHelpState();
}

class _WebHelpState extends State<WebHelp> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://metamask.zendesk.com/hc/en-us',
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: kBtnColor, size: 10),
        title: Text(
          'Get Help',
          style: TextStyle(color: kBtnColor),
        ),
        centerTitle: true,
      ),
    );
  }
}


//Protfolio Drawer
class ProtFolioWidget extends StatelessWidget {
  const ProtFolioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: kBtnColor, size: 10),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Column(
          children: [
            Header(),
          ],
        ),
        CustomCard(size: size),
      ]),
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

late List<TokenData> _chartData;
late TooltipBehavior _tooltipBehavior;

class _HeaderState extends State<Header> {
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.46,
        color: kBgPurpleColor.withOpacity(0.3),
        child: SfCircularChart(
          margin: EdgeInsets.only(top: 20),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            DoughnutSeries<TokenData, String>(
              dataSource: _chartData,
              xValueMapper: (TokenData data, _) => data.name,
              yValueMapper: (TokenData data, _) => data.price,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
            )
          ],
        ));
  }

  List<TokenData> getChartData() {
    final List<TokenData> chartData = [
      TokenData('BTC', 823.97),
      TokenData('ETH', 1257.39),
      TokenData('BNB', 5269.88),
      TokenData('ADA', 877.5),
      TokenData('XRP', 250.70),
      TokenData('DOGE', 600),
    ];
    return chartData;
  }
}

class TokenData {
  TokenData(this.name, this.price);
  final String name;
  final double price;
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: size.height * 0.60,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: kCardBGColor,
          boxShadow: kBtnShadow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tokens',
              style: kSubTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTokenCard(),
          ],
        ),
      ),
    );
  }
}

class CustomTokenCard extends StatelessWidget {
  const CustomTokenCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery(
        data: MediaQuery.of(context).removePadding(removeTop: true),
        child: ListView.builder(
          dragStartBehavior: DragStartBehavior.start,
          itemCount: 6,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CoinsDetail(coins[index]);
                  },
                ));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(coins[index].image),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: kDefaultPadding),
                          child: Text(
                              '${coins[index].total}' + ' ' + coins[index].id,
                              style: kSubTextStyle),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(
                              left: kDefaultPadding, top: 8),
                          child: Text(
                              '\$${f.format(coins[index].total * coins[index].price)}',
                              style: kSubTitleTextStyle),
                        ),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

final f = NumberFormat("#,##0.00", "en_US");
