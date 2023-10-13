import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

TextFormField kNoLimitPaddingTextField(
    {TextEditingController? controller,
    String? hint,
    Function()? onTap,
    bool? suffixIcon = false}) {
  return TextFormField(
    onTap: onTap,
    controller: controller,
    style: titleInter(
        color: Colors.black54, fontSize: 14, fontWeight: FontWeight.normal),
    // enabled: suffixIcon == true ? false : true,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(10),
        hintText: hint,
        suffixIcon: suffixIcon == true
            ? const Icon(Icons.keyboard_arrow_right_rounded,
                color: Colors.black45, size: 22)
            : null,
        hintStyle: titleInter(
            color: Colors.black54, fontSize: 14, fontWeight: FontWeight.normal),
        border: const OutlineInputBorder(borderSide: BorderSide.none)),
    validator: (value) {
      if (value == null) {
        return '$hint harus diisi';
      }
      return null;
    },
  );
}
