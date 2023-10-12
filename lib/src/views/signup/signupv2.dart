import 'dart:ui';
import 'package:craftgirlsss/src/controllers/GetxController/login_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldv2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';

class SignUpV2 extends StatefulWidget {
  const SignUpV2({super.key});

  @override
  State<SignUpV2> createState() => _SignUpV2State();
}

class _SignUpV2State extends State<SignUpV2> {
  final signUpC = Get.put(LoginCrontroller());
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final nameC = TextEditingController();
  final passwordC1 = TextEditingController();
  final passwordC2 = TextEditingController();
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
                  Center(
                    child: Text('Buat akun baru anda',
                        style: titleInter(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Nama Lengkap',
                    style: titleInter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  textFieldCustomized(
                      controller: nameC, height: 45, hintText: "Nama Lengkap"),
                  const SizedBox(height: 10),
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
                    'Nomor Handphone',
                    style: titleInter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  textFieldCustomized(
                      controller: phoneC,
                      height: 45,
                      hintText: "Nomor Handphone"),
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
                    child: TextFormField(
                      style: titleInter(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                      controller: passwordC1,
                      obscureText: invisible,
                      keyboardType: TextInputType.text,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mohon diisi";
                        }
                        return null;
                      },
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
                              invisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                              color: Colors.black54,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(7))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ulangi Password',
                    style: titleInter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      style: titleInter(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                      controller: passwordC2,
                      obscureText: invisible,
                      keyboardType: TextInputType.text,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mohon diisi";
                        }
                        if (value != passwordC1.text) {
                          return "Password tidak sama";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          contentPadding: const EdgeInsets.only(
                              left: 12, top: 12, right: 5, bottom: 12),
                          hintText: "Ulangi Password",
                          suffix: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  invisible = !invisible;
                                },
                              );
                            },
                            icon: Icon(
                              invisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                              color: Colors.black54,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(7))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Center(
                      child: AnimatedButton(
                        height: 43,
                        width: 200,
                        text: signUpC.isLoadingSignIn.value == true
                            ? "Loading..."
                            : "Masuk",
                        isReverse: true,
                        onPress: () async {
                          if (emailC.text.isNotEmpty &&
                              nameC.text.isNotEmpty &&
                              phoneC.text.isNotEmpty &&
                              passwordC1.text.isNotEmpty &&
                              passwordC2.text.isNotEmpty) {
                            await signUpC.fetchSignUp(context,
                                email: emailC.text,
                                name: nameC.text,
                                password: passwordC2.text,
                                phone: phoneC.text);
                          } else if (emailC.text.isEmpty ||
                              nameC.text.isEmpty ||
                              phoneC.text.isEmpty ||
                              passwordC1.text.isEmpty ||
                              passwordC2.text.isEmpty) {
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
                        backgroundColor: signUpC.isLoadingSignIn.value == true
                            ? Colors.white
                            : Colors.green,
                        borderColor: signUpC.isLoadingSignIn.value == true
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
                      Text("Sudah punya akun?",
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
