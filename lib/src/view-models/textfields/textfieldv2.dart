import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

SizedBox textFieldV2(
    {TextEditingController? controller,
    String? hintText,
    IconData? icon = Icons.search,
    bool preffixIcon = false,
    double? height = 40}) {
  return SizedBox(
    height: height,
    child: TextField(
      style: titleInter(
          color: Colors.black87, fontSize: 15, fontWeight: FontWeight.normal),
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText ?? 'Cari',
          prefixIconColor: Colors.black54,
          prefixIcon:
              preffixIcon == true ? Icon(icon, color: Colors.black54) : null,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    ),
  );
}



SizedBox textFieldCustomized(
    {TextEditingController? controller,
    String? hintText,
    IconData? icon = Icons.search,
    bool preffixIcon = false,
    double? height = 40}) {
  return SizedBox(
    height: height,
    child: TextField(
      style: titleInter(
          color: Colors.black87, fontSize: 15, fontWeight: FontWeight.normal),
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText ?? 'Cari',
          prefixIconColor: Colors.black54,
          prefixIcon:
              preffixIcon == true ? Icon(icon, color: Colors.black54) : null,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(7))),
    ),
  );
}
