import 'package:craftgirlsss/src/controllers/GetxController/login_controller.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/emailtextinput.dart';
import 'package:craftgirlsss/src/views/forgotpassword/forgotpassword.dart';
import 'package:craftgirlsss/src/views/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  LoginCrontroller loginC = Get.put(LoginCrontroller());
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xfffffcb9),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Text(
                  "Craftgirlsss",
                  style: title(fontSize: 46, color: Colors.black),
                ),
              ),
            ),
            Text(
              "Login",
              style: title(fontSize: 32, color: Colors.black),
            ),
            const SizedBox(height: 10),
            kTextField(controller: emailC),
            const SizedBox(height: 18),
            TextField(
              controller: passwordC,
              style: title(fontSize: 20, color: Colors.black),
              obscureText: invisible,
              keyboardType: TextInputType.emailAddress,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                    color: Colors.black,
                  ),
                ),
                filled: true,
                labelStyle: title(color: Colors.black, fontSize: 20),
                labelText: "Kata sandi",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(() => const ForgotPassword());
                    },
                    child: Text(
                      "Lupa kata sandi?",
                      style: title(color: Colors.blue, fontSize: 16),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: kButtons(context,
                    backgroundColor: loginC.isLoadingSignIn.value == true
                        ? Colors.grey.shade700
                        : Colors.green.shade500,
                    fonSize: 19,
                    label: loginC.isLoadingSignIn.value == true
                        ? "Loading..."
                        : "Masuk",
                    onPressed: loginC.isLoadingSignIn.value == true
                        ? () {}
                        : () async {
                            await loginC.fetchLogin(context,
                                email: emailC.text, password: passwordC.text);
                          }),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tidak punya akun?",
                    style: title(color: Colors.black, fontSize: 16)),
                TextButton(
                    onPressed: () {
                      Get.to(() => const SignUp());
                    },
                    child: Text(
                      "Buat sekarang",
                      style: title(color: Colors.blue, fontSize: 16),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
