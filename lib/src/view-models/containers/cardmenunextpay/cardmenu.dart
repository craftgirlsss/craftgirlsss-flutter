import 'package:craftgirlsss/src/view-models/buttons/imagebutton.dart';
import 'package:flutter/material.dart';

Widget cardMenuNextPay(context) {
  return Container(
      height: 170,
      // padding: const EdgeInsets.only(top: 7, bottom: 7, right: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(13),
        // border: Border.all(color: Colors.black12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(6, 6), // Shadow position
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Stack(children: [
          Positioned(
              //positioned helps to position widget wherever we want.
              top: -20,
              left: -50, //position of the widget
              child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange
                          .withOpacity(0.5) //background color with opacity
                      ))),
          Positioned(
              left: -80,
              top: -50,
              child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent.withOpacity(0.5)))),
          Positioned(
            left: 30,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: imageButton(
                  onPressed: () {},
                  label: "Tambah Saldo",
                  labelColor: Colors.white,
                  urlImage:
                      'assets/icons/freshicons/NextPayIcons/PlusCircle.png'),
            ),
          ),
          Positioned(
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: imageButton(
                  onPressed: () {},
                  label: "Bayar",
                  labelColor: Colors.white,
                  urlImage: 'assets/icons/freshicons/NextPayIcons/Scan.png'),
            ),
          ),
          Positioned(
            right: 30,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: imageButton(
                  onPressed: () {},
                  label: "Kode Bayar",
                  labelColor: Colors.white,
                  urlImage: 'assets/icons/freshicons/NextPayIcons/QrCode.png'),
            ),
          ),
          Positioned(
            left: 30,
            child: Container(
              height: 248,
              alignment: Alignment.center,
              child: imageButton(
                  onPressed: () {},
                  label: "Transfer",
                  labelColor: Colors.white,
                  urlImage:
                      'assets/icons/freshicons/NextPayIcons/UploadSimple.png'),
            ),
          ),
          Positioned(
            // top: 80,
            // right: 137,
            child: Container(
              height: 155,
              alignment: Alignment.bottomCenter,
              child: imageButton(
                  onPressed: () {},
                  label: "Transfer Antar Bank",
                  labelColor: Colors.white,
                  urlImage: 'assets/icons/freshicons/NextPayIcons/Swap.png'),
            ),
          ),
          Positioned(
            right: 30,
            child: Container(
              height: 240,
              alignment: Alignment.center,
              child: imageButton(
                  onPressed: () {},
                  label: "Tambah Saldo",
                  labelColor: Colors.white,
                  urlImage:
                      'assets/icons/freshicons/NextPayIcons/DownloadSimple.png'),
            ),
          ),
        ]),
      ));
}



/*
Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    imageButton(
                        onPressed: () {},
                        label: "Tambah Saldo",
                        urlImage: 'assets/icons/freshicons/PlusCircle.png'),
                    imageButton(
                        onPressed: () {},
                        label: "Bayar",
                        urlImage: 'assets/icons/freshicons/Barcode.png'),
                    imageButton(
                        onPressed: () {},
                        label: "Minta Saldo",
                        urlImage: 'assets/icons/freshicons/ArchiveBox.png'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    imageButton(
                        onPressed: () {},
                        label: "Transfer",
                        urlImage: 'assets/icons/freshicons/Exportshare.png'),
                    imageButton(
                        onPressed: () {},
                        label: "Transfer ke Bank",
                        urlImage: 'assets/icons/freshicons/Swap.png'),
                    imageButton(
                        onPressed: () {},
                        label: "Kode Bayar",
                        urlImage: 'assets/icons/freshicons/QrCode.png'),
                  ],
                ),
              )
            ],
          ),
        ),
        */
