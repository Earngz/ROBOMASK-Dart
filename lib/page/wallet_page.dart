import 'package:robomask/components/qr_scaner.dart';
import 'package:robomask/data.dart';
import 'package:robomask/components/drawer.dart';
import 'package:robomask/page/market_page.dart';
import 'package:robomask/theme/app_color.dart';
import 'package:robomask/theme/app_size.dart';
import 'package:robomask/theme/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: kBtnColor,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => QRViewExample(),
                ));
              },
              icon: ImageIcon(
                AssetImage('assets/images/qr-scan.png'),
                size: 45,
                color: kBtnColor,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      drawer: DrawerWidget(),
      body: WalletBody(),
    );
  }
}

class WalletBody extends StatefulWidget {
  const WalletBody({
    Key? key,
  }) : super(key: key);

  @override
  _WalletBodyState createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  final items = ['Wallet 1', 'Wallet 2'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        image: DecorationImage(
          image: AssetImage('assets/images/bgwallet.png'),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: Text(
                    'Total Balance',
                    style: kSubTextStyle,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  '\$11,509.96',
                  style: kTitleTextStyle,
                ),
                SizedBox(height: 16),
                Container(
                    width: 146,
                    height: 31,
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text('da9hn0193nvbo…'))),
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 65),
                  child: Row(children: [
                    IconBtnWidget(
                      image: 'assets/images/sent.png',
                      text: 'Send',
                      press: () => showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          context: context,
                          builder: (context) => buildSheetSend()),
                    ),
                    SizedBox(width: 22),
                    IconBtnWidget(
                      image: 'assets/images/recieve.png',
                      text: 'Receive',
                      press: () => showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          context: context,
                          builder: (context) => buildSheetRecieve()),
                    ),
                    SizedBox(width: 22),
                    IconBtnWidget(
                        image: 'assets/images/swap.png',
                        text: 'Swap',
                        press: () {}),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
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
                  TokenCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheetRecieve() => Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              child: Text(
                'Recieve',
                style: kSubTextStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: QrImage(
              data: '0xda9hn0193nvb458hd93kap031okearngk',
              version: QrVersions.auto,
              size: 250,
              gapless: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: Text('Scan address to recieve payment',
                style: TextStyle(fontSize: kBodyTextSize)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 146,
                    height: 31,
                    decoration: BoxDecoration(
                        color: kInactiveColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text('da9hn0193nvbo…'),
                    )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.content_copy_rounded))
              ],
            ),
          ),
        ],
      );

  Widget buildSheetSend() => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              child: Text(
                'Sent To',
                style: kSubTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('From: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                  Container(
                    width: 260,
                    height: 45,
                    decoration: BoxDecoration(
                        color: kInactiveColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text(
                            'Select',
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                          value: value,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value2) {
                            setState(() {
                              value = value2;
                            });
                          },
                          underline: SizedBox(),
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To:',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      width: 260,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: kInactiveColor, width: 3),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextField(
                            decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search, publice address(0x)',
                          hintStyle:
                              TextStyle(color: kSubtitleColor, fontSize: 15),
                        )),
                      ),
                    )
                  ]),
            ),
            SizedBox(height: 170),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Transfer between my account',
                style: TextStyle(color: kBgPurpleColor, fontSize: 18),
              ),
            ),
          ]);
        },
      );

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item, style: kSubTextStyle));
}

class TokenCard extends StatelessWidget {
  const TokenCard({
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

class IconBtnWidget extends StatelessWidget {
  const IconBtnWidget({
    Key? key,
    required this.image,
    required this.text,
    this.press,
  }) : super(key: key);
  final String image, text;
  final press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  color: kBackgroundColor, shape: BoxShape.circle),
              child: GestureDetector(
                onTap: press,
                child: Image(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(text),
        )
      ],
    );
  }
}

final f = NumberFormat("#,##0.00", "en_US");
