import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Container footer(context) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width,
    color: Colors.grey.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Next Shop',
          style: sfPro(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          'Version 1.0.0 Beta',
          style: sfPro(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        Text(
          'Powered by Craftgirlsss',
          style: sfPro(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}
