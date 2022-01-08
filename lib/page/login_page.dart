import 'package:robomask/page/Home_page.dart';
import 'package:robomask/page/register_page.dart';
import 'package:robomask/theme/app_color.dart';
import 'package:robomask/theme/app_size.dart';
import 'package:robomask/theme/app_style.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyLogin(),
    );
  }
}

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Login-backgound.png'),
                fit: BoxFit.cover),
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
          bottom: 0,
          child: Image.asset('assets/images/blur.png'),
          width: size.width,
        ),
        Positioned(
          top: 326,
          left: 144,
          child: Container(
            child: Center(
              child: Text(
                'Login',
                style: kTitleTextStyle,
              ),
            ),
          ),
        ),
        LoginCardWidget(),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 600, left: 81),
            child: Container(
              width: 214,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: kBtnShadow,
                  color: kBtnColor),
              child: Center(
                child: Text('Sign in', style: kBtnTextStyle),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return RegisterPage();
              },
            ));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 760, left: 115),
            child: Text(
              'Creat an account',
              style: TextStyle(
                  color: kTinytileColor,
                  fontSize: 18,
                  fontWeight: kMediumFontWeight),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 404,
      left: 25,
      right: 25,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                        hintStyle:
                            TextStyle(color: kSubtitleColor, fontSize: 17),
                        prefixIcon: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/user.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(color: kInactiveColor),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: kSubtitleColor, fontSize: 17),
                        prefixIcon: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/password.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
