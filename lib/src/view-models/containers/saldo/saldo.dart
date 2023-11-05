import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget saldoKoin({int? saldoKoin}) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.grey.shade100, borderRadius: BorderRadius.circular(25)),
    child: Row(
      children: [
        Image.asset(
          'assets/icons/freshicons/coins-colors.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 3),
        Text(
          saldoKoin.toString(),
          style: sfPro(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black45),
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 14,
          color: Colors.black45,
        )
      ],
    ),
  );
}
