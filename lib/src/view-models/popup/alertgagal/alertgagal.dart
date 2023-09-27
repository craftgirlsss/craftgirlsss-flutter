import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future kAlertGagal(context, {String? title = ''}) {
  return Get.defaultDialog(
      contentPadding: const EdgeInsets.all(7),
      title: "Gagal",
      titleStyle: const TextStyle(
          fontFamily: "Caveat",
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      content: Text(
        title!,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontFamily: "Caveat",
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.normal),
      ),
      titlePadding: const EdgeInsets.all(7),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(), elevation: 0),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"))
      ]);
}
