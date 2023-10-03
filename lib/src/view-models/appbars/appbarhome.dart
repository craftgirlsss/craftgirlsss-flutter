import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/favorite/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar kAppBarHome() {
  return AppBar(
    leadingWidth: 110,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleSpacing: 0,
    leading: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Text(
          "Craftgirlsss",
          textAlign: TextAlign.center,
          style: title(
              color: Colors.black87, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    actions: [
      IconButton(
          tooltip: 'Cari',
          onPressed: () {},
          icon: Image.asset('assets/icons/search.png')),
      IconButton(
          tooltip: 'Favorit',
          onPressed: () {
            Get.to(() => const FavoritePage());
          },
          icon: Image.asset('assets/icons/favorit.png')),
      IconButton(
          tooltip: 'Cart',
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/cart.png',
            scale: 0.9,
          )),
    ],
  );
}
