import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:craftgirlsss/src/mainpage.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/Introduction/splashscreen.dart';
import 'package:craftgirlsss/src/views/login/login.dart';
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
        Get.to(() => const MainPage());
      } else {
        Get.to(() => const LoginPage());
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
      backgroundColor: const Color(0xfffffcb9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Craftgirlsss...',
                  speed: const Duration(milliseconds: 170),
                  textStyle: title(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                )
              ],
              isRepeatingAnimation: false,
            ),
          )
        ],
      ),
    );
  }
}
