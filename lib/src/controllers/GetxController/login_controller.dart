import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'package:craftgirlsss/src/mainpage.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:craftgirlsss/src/view-models/popup/alertberhasil/alertberhasil.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:craftgirlsss/src/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCrontroller extends GetxController {
  var isLoadingSignUp = false.obs;
  var isLoadingSignIn = false.obs;
  var id = vars.client.auth.currentUser?.id;

  fetchLogin(context, {String? email, String? password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoadingSignIn.value = true;
    List checkEmail =
        await vars.client.from('user').select().eq('email', email);
    if (checkEmail.isNotEmpty) {
      try {
        await vars.client.auth
            .signInWithPassword(email: email, password: password!);
        isLoadingSignIn.value = false;
        Future.delayed(const Duration(seconds: 1), () async {
          await prefs.setBool('loggedIn', true);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
              (route) => false);
        });
      } catch (e) {
        isLoadingSignIn.value = false;
        kAlertGagal(context, title: e.toString());
      }
    } else {
      isLoadingSignIn.value = false;
      kAlertGagal(context, title: "Gagal login, email belum terdaftar");
    }
    isLoadingSignIn.value = false;
  }

  fetchSignUp(context,
      {String? email, String? password, String? name, String? phone}) async {
    isLoadingSignUp.value = true;
    if (isLoadingSignUp.value == true) {
      kLoading();
    }
    try {
      List checkUsers =
          await vars.client.from('user').select().eq('email', email);
      if (checkUsers.isNotEmpty) {
        kAlertGagal(context,
            title: "Akun sudah terdaftar, mohon kembali ke halaman login.");
      } else {
        await vars.client.auth.signUp(
            password: password!,
            email: email,
            data: {'name': name, 'phone': phone});
        kAlertBerhasil(context, content: "Mohon cek email dan klik link");
        Future.delayed(const Duration(seconds: 2), () async {
          await Get.to(() => const LoginPage());
        });
      }
    } catch (e) {
      kAlertGagal(context, title: e.toString());
    }
    isLoadingSignUp.value = false;
  }
}
