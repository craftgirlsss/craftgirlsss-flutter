import 'package:craftgirlsss/src/helpers/paddings/defaultpadding.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aturinformasitoko.dart';

class MulaiJualan extends StatefulWidget {
  const MulaiJualan({super.key});

  @override
  State<MulaiJualan> createState() => _MulaiJualanState();
}

class _MulaiJualanState extends State<MulaiJualan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
          autoImplyLeading: true, title: "Bergabung Menjadi Penjual"),
      body: Padding(
        padding: kDefaultPadding(),
        child: Column(
          children: [
            Center(
                child: Image.asset('assets/images/selling.png',
                    width: 200, height: 200)),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Untuk memulai menjadi penjual, daftar sebagai penjual dengan melengkapi indormasi yang diperlukan.",
                textAlign: TextAlign.center,
                style: sfPro(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: kButtonsNew(
            context,
            label: "Daftar Sekarang",
            onPressed: () => Get.to(() => const AturInformasiToko()),
          )),
    );
  }
}
