import 'dart:ui';
import 'package:craftgirlsss/src/controllers/GetxController/login_controller.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldv2.dart';
import 'package:craftgirlsss/src/views/forgotpassword/forgotpasswordv2.dart';
import 'package:craftgirlsss/src/views/signup/signupv2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';

class LoginPageV2 extends StatefulWidget {
  const LoginPageV2({super.key});

  @override
  State<LoginPageV2> createState() => _LoginPageV2State();
}

class _LoginPageV2State extends State<LoginPageV2> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  LoginCrontroller loginC = Get.put(LoginCrontroller());
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
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
                child: Text('Masuk ke akun anda',
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
              const SizedBox(height: 5),
              textFieldCustomized(
                  controller: emailC, height: 45, hintText: "Email"),
              const SizedBox(height: 10),
              Text(
                'Password',
                style: titleInter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 45,
                child: TextField(
                  style: titleInter(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  controller: passwordC,
                  obscureText: invisible,
                  keyboardType: TextInputType.text,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding: const EdgeInsets.only(
                          left: 12, top: 12, right: 5, bottom: 12),
                      hintText: "Password",
                      suffix: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              invisible = !invisible;
                            },
                          );
                        },
                        icon: Icon(
                          invisible ? Icons.visibility : Icons.visibility_off,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(7))),
                ),
              ),
              // textFieldCustomized(
              //     controller: passwordC, height: 45, hintText: "Password"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(() => const ForgotPasswordV2());
                    },
                    child: Text(
                      "Lupa kata sandi?",
                      style:
                          titleInter(color: Colors.pink.shade300, fontSize: 13),
                    ),
                  )
                ],
              ),
              Obx(
                () => Center(
                  child: AnimatedButton(
                    height: 43,
                    width: 200,
                    text: loginC.isLoadingSignIn.value == true
                        ? "Loading..."
                        : "Masuk",
                    isReverse: true,
                    onPress: () async {
                      if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
                        await loginC.fetchLogin(context,
                            email: emailC.text, password: passwordC.text);
                      } else if (emailC.text.isEmpty ||
                          passwordC.text.isEmpty) {
                        kAlertGagal(context,
                            title: "Mohon isikan form dengan benar!");
                      } else {
                        kAlertGagal(context,
                            title:
                                "Mohon maaf ada kendala dalam sistem, Mohon laporkan masalah ini ke alamat email craftgirlsssshopping@gmail.com agar segera dapat diperbaiki");
                      }
                    },
                    selectedTextColor: Colors.green,
                    transitionType: TransitionType.RIGHT_TO_LEFT,
                    textStyle: titleInter(color: Colors.white),
                    backgroundColor: loginC.isLoadingSignIn.value == true
                        ? Colors.white
                        : Colors.green,
                    borderColor: loginC.isLoadingSignIn.value == true
                        ? Colors.white
                        : Colors.green,
                    borderRadius: 50,
                    borderWidth: 2,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tidak punya akun?",
                      style: titleInter(color: Colors.black54, fontSize: 14)),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const SignUpV2());
                      },
                      child: Text(
                        "Buat sekarang",
                        style: titleInter(
                            color: Colors.pink.shade300, fontSize: 14),
                      )),
                ],
              ),
              Center(
                child: Text(
                  'Atau Masuk Dengan',
                  style: titleInter(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 50, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage('assets/icons/google.png'))),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage('assets/icons/facebook.png'),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage('assets/icons/X.png'))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
