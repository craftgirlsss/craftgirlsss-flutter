import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:flutter/material.dart';

Widget cardProductGridView(
    {String? productName,
    int? productPrice,
    Function()? onPressedFavorit,
    bool? needFavoritIcon,
    String? urlImage}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              offset: const Offset(0, 3))
        ]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/example.jpg',
              errorBuilder: (context, error, stackTrace) => const Text('error'),
              height: 150,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            productName ?? '-',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: "Inter"),
          ),
          needFavoritIcon == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatCurrency.format(productPrice),
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter"),
                    ),
                    InkWell(
                      onTap: onPressedFavorit,
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      formatCurrency.format(productPrice),
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter"),
                    ),
                  ],
                )
        ],
      ),
    ),
  );
}
