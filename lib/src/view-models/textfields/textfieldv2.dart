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
      style: sfPro(
          color: Colors.black54, fontSize: 15, fontWeight: FontWeight.normal),
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText ?? '',
          hintStyle: sfPro(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.normal),
          prefixIconColor: Colors.black54,
          prefixIcon:
              preffixIcon == true ? Icon(icon, color: Colors.black54) : null,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4))),
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
      style: sfPro(
          color: Colors.black87, fontSize: 15, fontWeight: FontWeight.normal),
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText ?? 'Cari',
          prefixIconColor: Colors.black54,
          prefixIcon:
              preffixIcon == true ? Icon(icon, color: Colors.black38) : null,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(3))),
    ),
  );
}

SizedBox textFieldV3(
    {TextEditingController? controller,
    String? hintText,
    IconData? icon = Icons.search,
    bool preffixIcon = false,
    double? height = 40}) {
  return SizedBox(
    height: height,
    child: TextField(
      style: sfPro(
          color: Colors.black87, fontSize: 15, fontWeight: FontWeight.normal),
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText ?? 'Cari',
          prefixIconColor: Colors.black54,
          prefixIcon:
              preffixIcon == true ? Icon(icon, color: Colors.black54) : null,
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
