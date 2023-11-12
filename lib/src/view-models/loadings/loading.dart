import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

Widget kLoading() {
  return Center(
    child: Container(
      width: 69,
      height: 69,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JumpingDots(
              animationDuration: const Duration(milliseconds: 70),
              verticalOffset: -5,
              color: Colors.black87,
              radius: 5,
              numberOfDots: 3,
            ),
            const SizedBox(height: 10),
            Text(
              "Memuat. . .",
              style: sfPro(fontSize: 13),
            )
          ],
        ),
      ),
    ),
  );
}
