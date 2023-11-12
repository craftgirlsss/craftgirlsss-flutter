import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget containerNextPay(context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
                blurRadius: 1, color: Colors.black12, offset: Offset(0, 1))
          ]),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/icons/freshicons/NextPayIcons/scanner.png',
              scale: 0.8,
            ),
            const VerticalDivider(
              color: Colors.black38,
              endIndent: 7,
              indent: 7,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/freshicons/NextPayIcons/next-wallet.png',
                      scale: 1.3,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "NextPay",
                      style: sfPro(fontSize: 13),
                    )
                  ],
                ),
                Text(
                  "Pakai NextPay",
                  style: sfPro(color: Colors.black54, fontSize: 10),
                ),
              ],
            ),
            const VerticalDivider(
              color: Colors.black38,
              endIndent: 7,
              indent: 7,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/freshicons/NextPayIcons/next-coins.png',
                      scale: 1.4,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "0",
                      style: sfPro(fontSize: 13),
                    )
                  ],
                ),
                Text(
                  "Gratis Koin 25RB!",
                  style: sfPro(color: Colors.black54, fontSize: 10),
                ),
              ],
            ),
            const VerticalDivider(
              color: Colors.black38,
              endIndent: 7,
              indent: 7,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/freshicons/NextPayIcons/next-transfer.png',
                      scale: 1.3,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Transfer",
                      style: sfPro(fontSize: 13),
                    )
                  ],
                ),
                Text(
                  "Gratis",
                  style: sfPro(color: Colors.black54, fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
