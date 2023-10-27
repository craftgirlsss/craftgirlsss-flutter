import 'package:craftgirlsss/src/helpers/mediaquery/mediaqueries.dart';
import 'package:craftgirlsss/src/view-models/buttons/imagebutton.dart';
import 'package:flutter/material.dart';

Widget cardMenuNextPay(context) {
  return Container(
    width: sized(context).width,
    height: sized(context).height / 3.8,
    padding: const EdgeInsets.only(top: 7, bottom: 7, right: 10, left: 10),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black12),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2,
          offset: Offset(6, 6), // Shadow position
        ),
      ],
    ),
    child: Column(
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
  );
}
