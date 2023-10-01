import 'package:flutter/material.dart';

Container footer(context) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width,
    color: Colors.grey.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Version 1.0.0',
          style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black54,
              fontSize: 11,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Develop by Craftgirlsss',
          style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black54,
              fontSize: 11,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
