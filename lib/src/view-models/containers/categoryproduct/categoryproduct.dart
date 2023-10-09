import 'package:flutter/material.dart';

Container categoryProduct(context) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10),
    color: Colors.transparent,
    width: MediaQuery.of(context).size.width,
    height: 65,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconCategory(
            categoryName: "Skincare", fileName: 'skincare.png', onTap: () {}),
        iconCategory(categoryName: "Baju", fileName: 'baju.png', onTap: () {}),
        iconCategory(
            categoryName: "Bouquet", fileName: 'bouquet.png', onTap: () {}),
        iconCategory(categoryName: "Tas", fileName: 'bag.png', onTap: () {}),
        iconCategory(
            categoryName: "Mahar Gift", fileName: 'gift.png', onTap: () {}),
        iconCategory(
            categoryName: "Hijab", fileName: 'hijab.png', onTap: () {}),
      ],
    ),
  );
}

Widget iconCategory(
    {String? fileName, String? categoryName, Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Image.asset(
          'assets/icons/$fileName',
          errorBuilder: (context, error, stackTrace) => const Text('Error'),
        ),
        const SizedBox(height: 3),
        Text(categoryName!,
            style: const TextStyle(
                fontFamily: 'Inter', fontSize: 12, color: Colors.black))
      ],
    ),
  );
}
