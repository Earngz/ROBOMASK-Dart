import 'package:robomask/data.dart';
import 'package:robomask/components/drawer.dart';
import 'package:robomask/theme/app_color.dart';
import 'package:robomask/theme/app_size.dart';
import 'package:robomask/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MarketPage extends StatelessWidget {
  MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar2(),
      drawer: DrawerWidget(),
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView.builder(
            itemCount: coins.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoinsDetail(coins[index])));
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20.0,
                                child: ClipRect(
                                  child: Image.network(
                                    coins[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          //listitle
                          Expanded(
                            flex: 3,
                            child: Builder(builder: (context) {
                              var volume = coins[index].volume;
                              return ListTile(
                                title: Text(coins[index].id),
                                subtitle: Text(
                                  'Vol:$volume',
                                  style: TextStyle(fontSize: 12),
                                ),
                              );
                            }),
                          ),
                          //graph
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 20,
                              child: coins[index].change == 0
                                  ? SfSparkLineChart(
                                      axisLineColor: Colors.transparent,
                                      color: changeColor(coins[index].change),
                                      data: coins[index].data)
                                  : SfSparkLineChart(
                                      axisLineColor: Colors.transparent,
                                      color: changeColor(coins[index].change),
                                      data: coins[index].data),
                            ),
                          ),
                          //cap
                          Expanded(
                            flex: 3,
                            child: Builder(
                              builder: (context) {
                                var value = f.format(coins[index].price);
                                return ListTile(
                                  title: Text(
                                    '$value',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  subtitle: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: percentChange(coins[index].change),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  } //ef

  Widget percentChange(double change) {
    var c = change;
    if (change > 0) {
      return Text('+$c%', style: TextStyle(color: Colors.green));
    } else {
      return Text('$c%', style: TextStyle(color: Colors.red));
    }
  } //ef

  Color changeColor(double value) {
    if (value > 0) {
      return Colors.green;
    } else
      return Colors.red;
  } //ef
} //ec

class CoinsDetail extends StatelessWidget {
  final Coin coin;

  CoinsDetail(this.coin);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: kBtnColor, size: 10),
        title: Text(
          coin.name,
          style: kSubTextStyle,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              '\$${f.format(coin.price)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  color: kBtnColor,
                  fontWeight: kMediumFontWeight),
            ),
            subtitle: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: percentChange(coin.change),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: ToggleSwitch(
                minWidth: 65,
                minHeight: 45,
                cornerRadius: 30,
                activeBgColors: [
                  [kBackgroundColor],
                  [kBackgroundColor],
                  [kBackgroundColor],
                  [kBackgroundColor],
                  [kBackgroundColor],
                ],
                borderColor: [toggleBg],
                activeFgColor: kTitleColor,
                inactiveBgColor: toggleBg,
                inactiveFgColor: kSubtitleColor,
                initialLabelIndex: 0,
                totalSwitches: 5,
                labels: ['24H', '1W', '1M', '1Y', 'ALL'],
                customTextStyles: [
                  TextStyle(fontWeight: FontWeight.w600),
                  TextStyle(fontWeight: FontWeight.w600),
                  TextStyle(fontWeight: FontWeight.w600),
                  TextStyle(fontWeight: FontWeight.w600),
                  TextStyle(fontWeight: FontWeight.w600)
                ],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: kDefaultPadding * 2.5, bottom: kDefaultPadding * 2.5),
            child: Container(
                width: size.width * 0.8,
                height: size.height / 4.5,
                child: SfSparkLineChart(
                  axisLineWidth: 0,
                  width: 5,
                  marker: SparkChartMarker(
                      size: 10, displayMode: SparkChartMarkerDisplayMode.all),
                  color: changeColor(coin.change),
                  data: coin.data,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 155,
                  height: 55,
                  decoration: BoxDecoration(
                    color: kCardBGColor,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: kBtnShadow,
                  ),
                  child: Center(
                      child: Text(
                    'Set Alert',
                    style: TextStyle(
                        color: kTinytileColor,
                        fontSize: 16,
                        fontWeight: kSemiBoldFontWeight),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 155,
                  height: 55,
                  decoration: BoxDecoration(
                    color: kBtnColor,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: kBtnShadow,
                  ),
                  child: Center(
                      child: Text(
                    'Converted',
                    style: TextStyle(
                        color: kBtnTxtColor,
                        fontSize: 16,
                        fontWeight: kSemiBoldFontWeight),
                  )),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  boxShadow: kBtnShadow,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Text(
                          'Market Statistic',
                          style: kSubTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: kDefaultPadding, left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Market Capitallization',
                              style: TextStyle(
                                fontSize: 16,
                                color: kSubtitleColor,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text('\$${c.format(coin.mcap)}'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: kDefaultPadding, left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Circulating Supply',
                              style: TextStyle(
                                fontSize: 16,
                                color: kSubtitleColor,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(
                                      '${c.format(coin.cs)}' + ' ' + coin.id),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget percentChange(double change) {
    var c = change;
    if (change > 0) {
      return Text('+$c%', style: TextStyle(color: Colors.green, fontSize: 16));
    } else {
      return Text('$c%', style: TextStyle(color: Colors.red, fontSize: 16));
    }
  } //ef

  Color changeColor(double value) {
    if (value > 0) {
      return Colors.green;
    } else
      return Colors.red;
  } //ef
} //ec

final f = NumberFormat("#,##0.00", "en_US");
final c = NumberFormat("#,##0", "en_US");

AppBar buildAppBar2() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Text(
          'Market',
          style: kSubTextStyle,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_rounded,
            size: 30,
            color: kBtnColor,
          ),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
