import 'package:craftgirlsss/src/helpers/paddings/defaultpadding.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  final String? email;
  const ResetPassword({super.key, this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(autoImplyLeading: true, title: "Ubah Kata Sandi"),
      body: ListView(
        padding: kDefaultPadding(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          Image.asset(
            'assets/images/security.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 15),
          Text(
            "Untuk memastikan bahwa ini adalah akun anda, mohon untuk mengklik tombol dibawah ini untuk memverifikasi ubah kata sandi ke alamat email ${widget.email?.replaceRange(3, 9, '********') ?? '-'}.",
            textAlign: TextAlign.center,
            style: sfPro(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 15),
          kButtonsNewWithImage(context,
              icons: Icons.mail,
              onPressed: () {},
              label: "Kirim link verifikasi")
        ],
      ),
    );
  }
}
