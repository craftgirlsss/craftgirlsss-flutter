import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget kFailedGetInformation() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/animations/no-data-available.json',
            height: 100, width: 100),
        Text(
          "Yahhh, gagal memuat informasi...",
          style: sfPro(fontSize: 13, color: Colors.black54),
        )
      ],
    ),
  );
}
