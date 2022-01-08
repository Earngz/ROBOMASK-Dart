import 'package:robomask/components/menuItem.dart';
import 'package:robomask/page/login_page.dart';
import 'package:robomask/theme/app_color.dart';
import 'package:robomask/theme/app_size.dart';
import 'package:flutter/material.dart';
import 'package:robomask/theme/app_style.dart';
import 'package:unicons/unicons.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

bool? firstVal = false;

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/drawerhead-2.png'),
            )),
            child: null,
          ),
          buildMenuItem(
            icon: UniconsLine.user,
            text: 'Account',
            onClicked: () => showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                context: context,
                builder: (context) => buildSheetAccount()),
          ),
          buildMenuItem(
              icon: UniconsLine.coins,
              text: 'Protfolio',
              onClicked: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ProtFolioWidget();
                  },
                ));
              }),
          Divider(color: kInactiveColor),
          buildMenuItem(
              icon: UniconsLine.info_circle,
              text: 'Contact Us',
              onClicked: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ContactUsItem();
                  },
                ));
              }),
          buildMenuItem(
              icon: UniconsLine.question_circle,
              text: 'Get Help',
              onClicked: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => WebHelp()));
              }),
          buildMenuItem(
              icon: UniconsLine.setting,
              text: 'Setting',
              onClicked: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SettingItem();
                  },
                ));
              }),
          Divider(color: kInactiveColor),
          buildMenuItem(
              icon: UniconsLine.signout,
              text: 'Sign Out',
              onClicked: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ));
              }),
        ],
      ),
    );
  }

  bool? checkBox1 = false;
  bool? checkBox2 = false;
  Widget buildSheetAccount() => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Account',
                style: kSubTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kBgPurpleColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ), //
                      child: CheckboxListTile(
                          secondary: const Icon(
                            UniconsLine.wallet,
                            size: 33,
                            color: kBgPurpleColor,
                          ),
                          activeColor: kBgPurpleColor,
                          title: Text(
                            'Wallet 1',
                            style: kSubTextStyle,
                          ),
                          subtitle:
                              Text('12.07 bnb ', style: kSubTitleTextStyle),
                          value: checkBox1,
                          onChanged: (v) {
                            setState(() {
                              checkBox1 = v;
                            });
                          }),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kBgPurpleColor),
                        borderRadius: BorderRadius.circular(20),
                      ), //BoxDecoration
                      child: CheckboxListTile(
                          secondary: const Icon(
                            UniconsLine.wallet,
                            size: 33,
                            color: kBgPurpleColor,
                          ),
                          activeColor: kBgPurpleColor,
                          title: Text(
                            'Wallet 2',
                            style: kSubTextStyle,
                          ),
                          subtitle: Text(
                            '21.29 bnb ',
                            style: kSubTitleTextStyle,
                          ),
                          value: checkBox2,
                          onChanged: (v) {
                            setState(() {
                              checkBox2 = v;
                            });
                          }),
                    ),
                    SizedBox(height: 80),
                    Divider(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Create New Account',
                        style: TextStyle(color: kBgPurpleColor, fontSize: 18),
                      ),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Import An Account',
                        style: TextStyle(color: kBgPurpleColor, fontSize: 18),
                      ),
                    ),
                  ]),
            )
          ]);
        },
      );
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = kBtnColor;
  final hoverColor = kBgPurpleColor;

  return Padding(
    padding: const EdgeInsets.only(left: kDefaultPadding),
    child: ListTile(
      leading: Icon(icon, size: 30, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 18)),
      hoverColor: hoverColor,
      onTap: onClicked,
    ),
  );
}
