import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future kAlertTidakTau(context,
    {String? content = '',
    String? title = 'Unknown',
    bool? isNeedCancelButton = false,
    Function()? onOK}) {
  return Get.defaultDialog(
      contentPadding: const EdgeInsets.all(7),
      title: title!,
      titleStyle: const TextStyle(
          fontFamily: "Caveat",
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      content: Text(
        content!,
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
            onPressed: onOK,
            child: const Text("OK")),
        isNeedCancelButton == true
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), elevation: 0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"))
            : Container(
                color: Colors.transparent,
                height: 0,
                width: 0,
              )
      ]);
}
