import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

Widget kLoading() {
  return JumpingDots(
    animationDuration: const Duration(milliseconds: 70),
    verticalOffset: -5,
    color: Colors.black87,
    radius: 5,
    numberOfDots: 3,
  );
}
