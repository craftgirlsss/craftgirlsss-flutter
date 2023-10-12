import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:craftgirlsss/src/mainpage.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/Introduction/splashscreen.dart';
import 'package:craftgirlsss/src/views/login/login.dart';
import 'package:craftgirlsss/src/views/login/loginv2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // fungsi untuk get logged in sudah atau belum
  Future getWasLoggedInOrNot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? wasIntroduction = prefs.getBool('introDone');
    bool? wasLogin = prefs.getBool('loggedIn');

    if (wasIntroduction != null && wasIntroduction == true) {
      if (wasLogin != null && wasLogin == true) {
        Future.delayed(
            Duration.zero,
            () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
                (route) => false));
      } else {
        Future.delayed(
            Duration.zero,
            () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPageV2()),
                (route) => false));
      }
    } else {
      Get.to(() => const IntroductionScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 4), () async => await getWasLoggedInOrNot());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Image.asset(
            'assets/images/background-login.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
        Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Craftgirlsss',
                speed: const Duration(milliseconds: 100),
                textStyle: title(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              )
            ],
            isRepeatingAnimation: false,
          ),
        )
      ],
    ));
  }
}
