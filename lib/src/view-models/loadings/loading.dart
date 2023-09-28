import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

Widget kLoading() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: Colors.grey.shade300),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        JumpingDots(
          color: Colors.white,
          radius: 5,
          numberOfDots: 3,
        ),
        const SizedBox(
          height: 6,
        ),
        const Text("Tunggu sebentar...")
      ],
    ),
  );
}
