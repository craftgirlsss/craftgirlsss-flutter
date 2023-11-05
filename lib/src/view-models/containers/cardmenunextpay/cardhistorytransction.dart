import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/helpers/mediaquery/mediaqueries.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget cardHistoryTransactionNextPay(context,
    {String? namaTransaksi = '-',
    String? deskripsi = '-',
    String? waktuTransaksi,
    String? statusTransaksi = '-',
    int? jumlahTransaksi = 0,
    String? urlImage,
    Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: sized(context).width,
      alignment: Alignment.center,
      height: 60,
      padding: const EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(2, 2), // Shadow position
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(urlImage ?? '',
                    errorBuilder: (context, error, stackTrace) =>
                        Text('Error', style: sfPro(fontSize: 12)),
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40),
                const SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(namaTransaksi!,
                        style: sfPro(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    Flexible(
                      child: Text(deskripsi!,
                          overflow: TextOverflow.ellipsis,
                          style: sfPro(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54)),
                    ),
                    Text(waktuTransaksi!,
                        style: sfPro(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54))
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(formatCurrency.format(jumlahTransaksi),
                      overflow: TextOverflow.ellipsis,
                      style: sfPro(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ),
                Row(
                  children: [
                    if (statusTransaksi == "Berhasil")
                      Image.asset(
                          'assets/icons/freshicons/NextPayIcons/CheckCircle.png')
                    else if (statusTransaksi == "Pending")
                      Image.asset(
                          'assets/icons/freshicons/NextPayIcons/Clock.png')
                    else
                      Image.asset(
                          'assets/icons/freshicons/NextPayIcons/WarningCircle.png'),
                    const SizedBox(width: 2),
                    Text(statusTransaksi!,
                        style: sfPro(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: statusTransaksi == 'Berhasil'
                                ? Colors.green
                                : statusTransaksi == 'Pending'
                                    ? Colors.yellow
                                    : Colors.black54)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
