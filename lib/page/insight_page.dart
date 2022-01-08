import 'package:robomask/components/drawer.dart';
import 'package:robomask/data.dart';
import 'package:robomask/theme/app_color.dart';
import 'package:robomask/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:unicons/unicons.dart';

class InsightPage extends StatefulWidget {
  const InsightPage({Key? key}) : super(key: key);

  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar2(),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 105),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 30),
                      child: Text(
                        'Insights',
                        style: TextStyle(
                            fontSize: 35,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              NewsCardWidget(
                                image: newses[0].image,
                                text: newses[0].title,
                              ),
                              NewsCardWidget(
                                image: newses[1].image,
                                text: newses[1].title,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ToggleSwitch(
                          minWidth: 100,
                          minHeight: 40,
                          cornerRadius: 30,
                          activeBgColors: [
                            [kBackgroundColor],
                            [kBackgroundColor],
                            [kBackgroundColor],
                          ],
                          borderColor: [toggleBg],
                          activeFgColor: kTitleColor,
                          inactiveBgColor: toggleBg,
                          inactiveFgColor: kSubtitleColor,
                          initialLabelIndex: 0,
                          totalSwitches: 3,
                          labels: ['Trending', 'Recent', 'Popular'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    NewsCard(
                      image: newses[2].image,
                      text: newses[2].title,
                    ),
                    NewsCard(
                      image: newses[3].image,
                      text: newses[3].title,
                    ),
                    NewsCard(
                      image: newses[4].image,
                      text: newses[4].title,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class InsightItemDetail extends StatelessWidget {
  const InsightItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: size.height / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(newses[index].image),
                  )),
            );
          },
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  final String image, text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          height: 100,
          width: size.width - 30,
          margin: EdgeInsets.fromLTRB(10, 8, 0, 8),
          decoration: BoxDecoration(
              boxShadow: kCardShadow,
              borderRadius: BorderRadius.circular(20),
              color: kBackgroundColor),
          child: Row(
            children: [
              Container(
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(image))),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        width: 190,
                        child: Text(
                          text,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 15,
                              color: kTitleColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          width: 267,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 155, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  UniconsLine.clock,
                  size: 20,
                  color: kBackgroundColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    '3 days',
                    style: TextStyle(color: kBackgroundColor, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          width: 235,
          child: Text(
            text,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 15,
              color: kTitleColor,
            ),
          ),
        ),
      ],
    );
  }
}

AppBar buildAppBar2() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search_rounded,
          size: 30,
          color: kBtnColor,
        ),
      )
    ]),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
