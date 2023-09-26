import 'package:flutter/material.dart';

AppBar kAppBar(context, {bool? isTitle = false, String? title}) {
  return AppBar(
    elevation: 0,
    title: isTitle == true ? Text(title!) : null,
    backgroundColor: Colors.transparent,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 23,
          color: Colors.black,
        )),
  );
}
