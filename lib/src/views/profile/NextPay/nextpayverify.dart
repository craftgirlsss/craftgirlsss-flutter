import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/helpers/paddings/defaultpadding.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: defaultAppBar(
            autoImplyLeading: true, title: "Verifikasi Akun Anda"),
        body: ListView(
          padding: kDefaultPadding(),
          children: [
            Text(
              "Kami telah mengirimkan kode verifikasi kepada email ${profileC.profileModels[0].email?.replaceRange(2, 8, '******')} untuk dapat mengaktifasi akun NextPay anda.",
              style: sfPro(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                if (verificationCode.length == 5) {
                  onComplete.value = true;
                } else {
                  onComplete.value = false;
                }
              }, // end onSubmit
            ),
          ],
        ),
        bottomSheet: Obx(
          () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: kButtonsNew(
                context,
                label: "Submit",
                onPressed: onComplete.value == true
                    ? () async {
                        // Get.to(() => const NextPayVerifyPage());
                      }
                    : null,
              )),
        ),
      ),
    );
  }
}
