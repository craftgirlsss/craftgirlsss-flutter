import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'package:craftgirlsss/src/view-models/popup/alertberhasil/alertberhasil.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:craftgirlsss/src/views/login/login.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginCrontroller extends GetxController {
  var isLoading = false.obs;
  var id = vars.client.auth.currentUser?.id;

  fetchLogin() async {}

  fetchSignUp(context,
      {String? email, String? password, String? name, String? phone}) async {
    isLoading.value = true;
    try {
      List checkUsers =
          await vars.client.from('user').select().eq('email', email);
      print(checkUsers.length);
      if (checkUsers.isNotEmpty) {
        kAlertGagal(context,
            title: "Akun sudah terdaftar, mohon kembali ke halaman login.");
      } else {
        final AuthResponse res = await vars.client.auth.signUp(
            password: password!,
            email: email,
            data: {'name': name, 'phone': phone});
        final Session? session = res.session;
        final User? user = res.user;
        print("ini output session $session");
        print("ini output user $user");
        kAlertBerhasil(context, content: "Mohon cek email dan klik link");
        Future.delayed(const Duration(seconds: 2), () async {
          await Get.to(() => const LoginPage());
        });
      }
    } catch (e) {
      kAlertGagal(context, title: e.toString());
    }
    isLoading.value = false;
  }
}
