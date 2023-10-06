import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

showProductSpecification(context) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                color: Colors.grey.shade200,
                child: Container(
                  width: 60,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: const [
                    TableRow(children: [
                      Text('Stok'),
                      Text('31'),
                    ]),
                    TableRow(children: [
                      Text('Ukuran'),
                      Text('XL, L, XXL, M'),
                    ]),
                    TableRow(children: [
                      Text('Merek'),
                      Text('Cardinal'),
                    ])
                  ],
                ),
              )
            ],
          ),
        );
      });
}

showProductOngkir(context,
    {String? kabupaten,
    String? tipeOngkir,
    int? priceOngkir,
    String? startDate,
    String? endDate,
    String? month,
    Function()? onTapLocationName}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    "Informasi Ongkir",
                    style: titleInter(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
                const Divider(),
                ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: onTapLocationName,
                    title: Text(
                      'Kirim ke',
                      style: titleInter(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                    trailing: ElevatedButton.icon(
                      onPressed: onTapLocationName,
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.green,
                          shape: const StadiumBorder()),
                      icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      label: Text(
                        kabupaten != null ? kabupaten.toUpperCase() : '-',
                        style: titleInter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    )),
                ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      'Biaya',
                      style: titleInter(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                    trailing: Text(priceOngkir != null
                        ? formatCurrency.format(priceOngkir)
                        : 'Rp. 0')),
                Text(
                  'Akan diterima pada tanggal $startDate - $endDate $month',
                  style: titleInter(
                      color: Colors.black54,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        );
      });
}
