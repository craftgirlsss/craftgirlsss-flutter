import 'package:craftgirlsss/src/controllers/GetxController/login_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/emailtextinput.dart';
// import 'package:craftgirlsss/src/views/confirmpassword/confirmpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailC = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginCrontroller forgotC = Get.put(LoginCrontroller());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xfffffcb9),
        appBar: kAppBar(context, isTitle: false),
        body: Form(
          key: formKey,
          child: ListView(
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
                "Lupa Sandi",
                style: title(fontSize: 32, color: Colors.black),
              ),
              const SizedBox(height: 10),
              kTextField(controller: emailC),
              const SizedBox(height: 27),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: kButtons(context,
                      backgroundColor:
                          forgotC.isLoadingForgotPassword.value == true
                              ? Colors.grey.shade700
                              : Colors.green.shade500,
                      fonSize: 19,
                      label: forgotC.isLoadingForgotPassword.value == true
                          ? "Loading..."
                          : "Konfirmasi", onPressed: () async {
                    if (formKey.currentState?.validate() == true) {
                      await forgotC.fetchForgotPassword(context,
                          email: emailC.text);
                    }
                    // Get.to(() => const ConfirmPassword());
                  }),
                ),
              ),
              const SizedBox(height: 27),
              Center(
                child: Text(
                  "Mohon cek email anda untuk mengkonfirmasi lupa sandi.",
                  textAlign: TextAlign.center,
                  style: title(color: Colors.black, fontSize: 19),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
