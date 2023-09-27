import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

TextFormField kTextField(
    {String? label = "Email",
    TextEditingController? controller,
    TextInputType? textInputType = TextInputType.name}) {
  return TextFormField(
    controller: controller,
    style: title(fontSize: 20, color: Colors.black),
    keyboardType: textInputType,
    validator: (value) {
      if (value!.isEmpty) {
        return "Mohon diisi";
      }
      return null;
    },
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      filled: true, //<-- SEE HERE
      labelStyle: title(color: Colors.black, fontSize: 20),
      labelText: label,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
    ),
  );
}
