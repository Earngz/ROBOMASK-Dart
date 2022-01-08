import 'package:robomask/page/login_page.dart';
import 'package:robomask/theme/app_color.dart';
import 'package:robomask/theme/app_style.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 65,
              ),
              child: Container(
                width: 290,
                height: 290,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/robo-with-bg.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  child: Center(
                    child: Container(
                      child: Text('Register', style: kTitleTextStyle),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InfoWidget(
                    hintText: 'Username',
                    prefixIcon: 'assets/images/user.png',
                  ),
                  SizedBox(
                    width: 15,
                    height: 15,
                  ),
                  InfoWidget(
                    hintText: 'Email',
                    prefixIcon: 'assets/images/email.png',
                  ),
                  SizedBox(
                    width: 15,
                    height: 15,
                  ),
                  InfoWidget(
                    hintText: 'Password',
                    prefixIcon: 'assets/images/password.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 5),
                    child: Container(
                      width: 330,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: kBtnShadow,
                        color: kBtnColor,
                      ),
                      // ignore: deprecated_member_use
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kBtnColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: Text('Sign up', style: kBtnTextStyle),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlert();
                              });
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);
  final String hintText;
  final String prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: kSubtitleColor, fontSize: 17),
          prefixIcon: Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            child: Image.asset(
              prefixIcon,
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAlert extends StatelessWidget {
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Wrap(spacing: 10, runSpacing: 10, children: [
                        Text(
                          'Congraturations, your account',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'has been successfully created.',
                          style: TextStyle(fontSize: 18, color: kTitleColor),
                        )
                      ]),
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
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ));
                      },
                      child: Text(
                        'Continue',
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

