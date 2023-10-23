import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/ticket/ticket.dart';
import 'package:flutter/material.dart';

Widget ticketContainerGratisOngkir(context,
    {String? title,
    String? subtitle,
    Function()? onPressed,
    String? expireDate}) {
  return ClipPath(
    clipper: CustomTicket(), // <-- CustomClipper
    child: Container(
        padding: const EdgeInsets.only(left: 30, top: 15, right: 30),
        color: Colors.green.shade200, // <-- background color
        height: 130, // <-- height
        width: MediaQuery.of(context).size.width, // <-- width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '-',
              style: sfPro(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              subtitle ?? '-',
              style: sfPro(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Berlaku sampai\n$expireDate",
                  style: sfPro(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Flexible(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  onPressed: onPressed,
                  child: Text("Gunakan",
                      style: sfPro(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ))
              ],
            ),
          ],
        ) // <-- child can be any widget
        ),
  );
}

Widget ticketContainerCashBack(context,
    {String? title,
    String? subtitle,
    Function()? onPressed,
    String? expireDate}) {
  return ClipPath(
    clipper: CustomTicket(), // <-- CustomClipper
    child: Container(
        padding: const EdgeInsets.only(left: 30, top: 15, right: 30),
        color: Colors.red.shade200, // <-- background color
        height: 130, // <-- height
        width: MediaQuery.of(context).size.width, // <-- width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '-',
              style: sfPro(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              subtitle ?? '-',
              style: sfPro(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Berlaku sampai\n$expireDate",
                  style: sfPro(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Flexible(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  onPressed: onPressed,
                  child: Text("Gunakan",
                      style: sfPro(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ))
              ],
            ),
          ],
        ) // <-- child can be any widget
        ),
  );
}
