import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/helpers/paddings/defaultpadding.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/profile/NextPay/nextpaydashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class NextPayVerifyPage extends StatefulWidget {
  const NextPayVerifyPage({super.key});

  @override
  State<NextPayVerifyPage> createState() => _NextPayVerifyPageState();
}

class _NextPayVerifyPageState extends State<NextPayVerifyPage> {
  ProfileController profileC = Get.put(ProfileController());
  var onComplete = false.obs;
  var otp = ''.obs;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: defaultAppBar(autoImplyLeading: true, title: "Atur PIN"),
        body: ListView(
          padding: kDefaultPadding(),
          children: [
            Text(
              "Atur PIN NextPay",
              style: titleHome(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 6,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                if (verificationCode.length == 6) {
                  onComplete.value = true;
                  otp.value = verificationCode;
                } else {
                  onComplete.value = false;
                }
              }, // end onSubmit
            ),
            const SizedBox(height: 10),
            Text(
              'Atur PIN NextPay anda untuk menjaga keamanan saldo anda, pastikan atur pin yang sulit untuk ditebak',
              textAlign: TextAlign.center,
              style: sfPro(color: Colors.black54, fontSize: 15),
            )
          ],
        ),
        bottomSheet: Obx(
          () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: kButtonsNew(
                context,
                label:
                    profileC.isLoadingSetValue.isTrue ? "Loading..." : "Submit",
                onPressed: onComplete.value == true
                    ? () async {
                        await profileC.setUpPinNextPay(
                            passcode: int.parse(otp.value));
                        Get.to(() => const NextPayDashboard());
                      }
                    : null,
              )),
        ),
      ),
    );
  }
}
