import 'dart:ui';
import 'package:craftgirlsss/src/controllers/GetxController/login_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldv2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';

class ForgotPasswordV2 extends StatefulWidget {
  const ForgotPasswordV2({super.key});

  @override
  State<ForgotPasswordV2> createState() => _ForgotPasswordV2State();
}

class _ForgotPasswordV2State extends State<ForgotPasswordV2> {
  final emailC = TextEditingController();
  LoginCrontroller forgotC = Get.put(LoginCrontroller());
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: defaultAppBar(autoImplyLeading: true, title: "Lupa Password"),
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
              ListView(
                padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
                children: [
                  Center(
                    child: Hero(
                      tag: 'craftgirlsss',
                      child: Text(
                        'Craftgirlsss',
                        style: title(
                            color: Colors.black54,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                        'Masukkan alamat email akun anda yang telah terdaftar sebelumnya',
                        textAlign: TextAlign.center,
                        style: titleInter(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Email',
                    style: titleInter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  textFieldCustomized(
                      controller: emailC, height: 45, hintText: "Email"),
                  const SizedBox(height: 20),
                  Obx(
                    () => Center(
                      child: AnimatedButton(
                        height: 43,
                        width: 200,
                        text: forgotC.isLoadingSignIn.value == true
                            ? "Loading..."
                            : "Submit",
                        isReverse: true,
                        onPress: () async {
                          if (emailC.text.isNotEmpty) {
                            await forgotC.fetchForgotPassword(context,
                                email: emailC.text);
                          } else if (emailC.text.isEmpty) {
                            kAlertGagal(context,
                                title: "Mohon isikan form dengan benar!");
                          } else {
                            kAlertGagal(context,
                                title:
                                    "Mohon maaf ada kendala dalam sistem, Mohon laporkan masalah ini ke alamat email craftgirlsssshopping@gmail.com agar dapat segera diperbaiki");
                          }
                        },
                        selectedTextColor: Colors.green,
                        transitionType: TransitionType.RIGHT_TO_LEFT,
                        textStyle: titleInter(color: Colors.white),
                        backgroundColor: forgotC.isLoadingSignIn.value == true
                            ? Colors.white
                            : Colors.green,
                        borderColor: forgotC.isLoadingSignIn.value == true
                            ? Colors.white
                            : Colors.green,
                        borderRadius: 50,
                        borderWidth: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ingat password saya?",
                          style:
                              titleInter(color: Colors.black54, fontSize: 14)),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Masuk sekarang",
                            style: titleInter(
                                color: Colors.pink.shade300, fontSize: 14),
                          )),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
