import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Container kOngkir(
    {Function()? onTap,
    int? ongkir,
    String? startDate,
    String? endDate,
    String? month}) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
    color: Colors.white,
    child: Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ongkos Kirim ",
            style: sfPro(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            formatCurrency.format(ongkir ?? 0),
            style: sfPro(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13),
          )
        ],
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Akan diterima pada tanggal $startDate - $endDate $month',
            textAlign: TextAlign.start,
            style: sfPro(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 12),
          ),
        ],
      ),
      TextButton(
          onPressed: onTap,
          child: Text(
            'Lihat detail',
            style: sfPro(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
          ))
    ]),
  );
}
