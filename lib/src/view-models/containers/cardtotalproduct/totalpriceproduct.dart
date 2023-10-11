import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Container totalPriceProductCheckOut(context,
    {int? orderTotal,
    int? grandTotal,
    int? discount,
    int? biayaLainnya,
    int? biayaPengiriman}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: Colors.grey.shade200),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informasi Pemesanan",
          style: titleInter(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Total Pemesanan',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          Text(orderTotal != null ? formatCurrency.format(orderTotal) : 'Rp 0',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Biaya Pengiriman',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          Text(
              biayaPengiriman != null
                  ? formatCurrency.format(biayaPengiriman)
                  : 'Rp 0',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Biaya Lainnya',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          Text(
              biayaLainnya != null
                  ? formatCurrency.format(biayaLainnya)
                  : 'Rp 0',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Diskon',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          Text(
              discount != null
                  ? "-${formatCurrency.format(discount)}"
                  : '-Rp 0',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ]),
        const Divider(color: Colors.black54, thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Grand Total',
                style: titleInter(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            Text(
                grandTotal != null ? formatCurrency.format(grandTotal) : 'Rp 0',
                style: titleInter(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
  );
}
