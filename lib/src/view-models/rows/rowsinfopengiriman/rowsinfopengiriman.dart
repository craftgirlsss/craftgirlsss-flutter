import 'package:craftgirlsss/src/view-models/columns/columnsitem/columnitem.dart';
import 'package:flutter/material.dart';

Widget kRowsInfoPengiriman() {
  return Container(
    padding: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.black12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        kColumnItem(
            name: "Dikemas",
            urlAsset: 'assets/icons/box.png',
            onPressed: () {}),
        kColumnItem(
            name: "Dikirim",
            urlAsset: 'assets/icons/sending.png',
            onPressed: () {}),
        kColumnItem(
            name: "Selesai",
            urlAsset: 'assets/icons/done.png',
            onPressed: () {}),
        kColumnItem(
            name: "Retur",
            urlAsset: 'assets/icons/return.png',
            onPressed: () {}),
      ],
    ),
  );
}
