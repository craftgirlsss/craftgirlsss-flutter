import 'package:flutter/material.dart';

TextStyle title(
    {double? fontSize = 18,
    Color? color = Colors.black,
    FontWeight? fontWeight = FontWeight.bold}) {
  return TextStyle(
      fontFamily: "Caveat",
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}

TextStyle titleInter(
    {double? fontSize = 18,
    Color? color = Colors.black,
    FontWeight? fontWeight = FontWeight.bold}) {
  return TextStyle(
      fontFamily: "Inter",
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}
