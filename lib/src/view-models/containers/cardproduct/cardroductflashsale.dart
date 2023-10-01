import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:flutter/material.dart';

Widget cardFlashsale(
    {Function()? onTap, String? productName, int? percentDiscount}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(1),
      width: 140,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
              image: AssetImage('assets/images/example.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              right: 10,
              top: 6,
              child: containerDiscount(
                  percentDiscount: percentDiscount.toString())),
          Positioned(bottom: 10, child: priceProduct(priceProduct: 139000))
        ],
      ),
    ),
  );
}

//Container diskon persen kuning
Container containerDiscount({String? percentDiscount}) {
  return Container(
    width: 36,
    height: 45,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(7), topRight: Radius.circular(7)),
      color: Colors.amber.shade400,
    ),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'OFF',
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Text(
            percentDiscount != null ? "$percentDiscount%" : '0%',
            style: const TextStyle(
                fontFamily: 'Inter', fontSize: 10, fontWeight: FontWeight.bold),
          )
        ]),
  );
}

Container priceProduct({int? priceProduct}) {
  return Container(
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
        color: Colors.grey.shade400,
        border: const Border.fromBorderSide(
            BorderSide(color: Colors.black26, width: 1)),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
    child: Text(
      priceProduct != null ? formatCurrency.format(priceProduct) : 'Rp 0',
      style: const TextStyle(
          fontSize: 13,
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
          color: Colors.red),
    ),
  );
}
