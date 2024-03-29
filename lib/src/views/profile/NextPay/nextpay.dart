import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'nextpayverify.dart';

class NextPay extends StatefulWidget {
  const NextPay({super.key});

  @override
  State<NextPay> createState() => _NextPayState();
}

class _NextPayState extends State<NextPay> {
  // InputController controller = InputController();
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    // print(profileController.profileModels[0].email);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(autoImplyLeading: true, title: "NextPay"),
      body: ListView(
        children: [
          Text(
            'Aktivasi NextPay',
            style: sfPro(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Untuk meyakinkan bahwa hanya anda yang dapat mengakses NextPay ini, Kami meminta anda untuk melakukan aktifasi terlebih dahulu.',
            style: sfPro(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Image.asset(
            'assets/images/wallet-image.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 15),
        ],
      ),
      bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: kButtonsNew(
            context,
            label: profileController.isLoadingSetValue.isTrue
                ? "Loading..."
                : "Aktivasi Sekarang",
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await profileController.activatingNextPay();
              await prefs.setBool('nextpay_active', true);
              Get.to(() => const NextPayVerifyPage());
              // screenLock(
              //     context: context,
              //     correctString: "123456",
              //     canCancel: true,
              //     // onOpened: () => Get.back(),
              //     onUnlocked: () {
              //       Get.to(() => const NextPayDashboard());
              //     },
              //     useBlur: true,
              //     maxRetries: 5,
              //     title: const Text("Atur Pin NextPay"));
            },
          )),
    );
  }
}
