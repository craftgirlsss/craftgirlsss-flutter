import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget kBackButton() {
  return InkWell(
    onTap: () => Get.back(),
    child: Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.black54,
      ),
    ),
  );
}
