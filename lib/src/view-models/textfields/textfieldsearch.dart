import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

SizedBox kSearchTextField(
    {TextEditingController? controller,
    String? hintText,
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
          contentPadding: const EdgeInsets.all(3),
          hintText: hintText ?? 'Cari',
          hintStyle: sfPro(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.normal),
          prefixIconColor: Colors.black54,
          prefixIcon: const Icon(Icons.search, color: Colors.black54),
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

SizedBox kSearchTextFieldHome(
    {TextEditingController? controller,
    String? hintText,
    double? height = 40}) {
  return SizedBox(
    height: height,
    child: TextField(
      style: sfPro(
          color: const Color.fromRGBO(0, 0, 0, 0.867),
          fontSize: 15,
          fontWeight: FontWeight.normal),
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.all(3),
          hintText: hintText ?? 'Cari Produk',
          hintStyle: sfPro(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.normal),
          prefixIconColor: Colors.black54,
          prefixIcon:
              Image.asset('assets/icons/freshicons/MagnifyingGlass.png'),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none)),
    ),
  );
}
