import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/emailtextinput.dart';
import 'package:craftgirlsss/src/views/confirmpassword/confirmpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffcb9),
      appBar: kAppBar(context, isTitle: false),
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
            "Lupa Sandi",
            style: title(fontSize: 32, color: Colors.black),
          ),
          const SizedBox(height: 10),
          kTextField(controller: emailC),
          const SizedBox(height: 27),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: kButtons(context,
                backgroundColor: Colors.green.shade500,
                fonSize: 19,
                label: "Konfirmasi", onPressed: () {
              Get.to(() => const ConfirmPassword());
            }),
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
    );
  }
}