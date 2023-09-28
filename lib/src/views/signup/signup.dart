import 'package:craftgirlsss/src/controllers/GetxController/login_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/emailtextinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpC = Get.put(LoginCrontroller());
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final nameC = TextEditingController();
  final passwordC1 = TextEditingController();
  final passwordC2 = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  bool invisible = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xfffffcb9),
        appBar: kAppBar(context, isTitle: false),
        body: Form(
          key: form,
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
                "Buat Akun",
                style: title(fontSize: 32, color: Colors.black),
              ),
              const SizedBox(height: 10),
              kTextField(
                controller: nameC,
                label: "Nama",
              ),
              const SizedBox(height: 18),
              kTextField(controller: emailC),
              const SizedBox(height: 18),
              kTextField(
                  controller: phoneC,
                  label: "Nomor Handphone",
                  textInputType: TextInputType.number),
              const SizedBox(height: 18),
              TextFormField(
                controller: passwordC1,
                style: title(fontSize: 20, color: Colors.black),
                obscureText: invisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Mohon diisi";
                  }
                  return null;
                },
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
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: passwordC2,
                style: title(fontSize: 20, color: Colors.black),
                obscureText: invisible,
                keyboardType: TextInputType.emailAddress,
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
                  filled: true, //<-- SEE HERE
                  labelStyle: title(color: Colors.black, fontSize: 20),
                  labelText: "Ulangi kata sandi",
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
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: kButtons(context,
                      backgroundColor: signUpC.isLoadingSignUp.value == true
                          ? Colors.grey.shade700
                          : Colors.green.shade500,
                      fonSize: 19,
                      labelColor: signUpC.isLoadingSignUp.value == true
                          ? Colors.black
                          : Colors.white,
                      label: signUpC.isLoadingSignUp.value == true
                          ? "Loading..."
                          : "Daftar",
                      onPressed: signUpC.isLoadingSignUp.value == true
                          ? () {}
                          : () async {
                              form.currentState?.validate();
                              await signUpC.fetchSignUp(context,
                                  email: emailC.text,
                                  name: nameC.text,
                                  password: passwordC2.text,
                                  phone: phoneC.text);
                              // kAlertBerhasil(context, content: "Berhasil");
                            }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
