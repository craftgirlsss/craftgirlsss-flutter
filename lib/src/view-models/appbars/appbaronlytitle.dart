import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

AppBar kAppBarOnlyTitle({String? titleText}) {
  return AppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      titleText!,
      style:
          title(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
