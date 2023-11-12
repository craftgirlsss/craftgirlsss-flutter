import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget containerIconsCategory() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                    "assets/icons/freshicons/NextPayIcons/next-pulsa.png"),
              ),
              const SizedBox(height: 7),
              Container(
                color: Colors.transparent,
                width: 65,
                child: Text(
                  "Pulsa, Tagihan dan Tiket",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: sfPro(fontSize: 10),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                    "assets/icons/freshicons/NextPayIcons/next-live.png"),
              ),
              const SizedBox(height: 7),
              Container(
                color: Colors.transparent,
                width: 65,
                child: Text(
                  "Next Live",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: sfPro(fontSize: 10),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                    "assets/icons/freshicons/NextPayIcons/next-food.png"),
              ),
              const SizedBox(height: 7),
              Container(
                color: Colors.transparent,
                width: 65,
                child: Text(
                  "Next Food",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: sfPro(fontSize: 10),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                    "assets/icons/freshicons/NextPayIcons/next-coupon.png"),
              ),
              const SizedBox(height: 7),
              Container(
                color: Colors.transparent,
                width: 65,
                child: Text(
                  "Gratis Ongkir dan Voucher",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: sfPro(fontSize: 10),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                    "assets/icons/freshicons/NextPayIcons/next-play.png"),
              ),
              const SizedBox(height: 7),
              Container(
                color: Colors.transparent,
                width: 65,
                child: Text(
                  "Next Play",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: sfPro(fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
