import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/cards/cardproduct.dart';
import 'package:craftgirlsss/src/views/products/productdetail/productdetailcheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffcb9),
      appBar: kAppBar(context,
          autoImplyLeading: true, isTitle: true, titleText: 'Favorit'),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        itemCount: 11,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 1 / 1.4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        itemBuilder: (context, index) => InkWell(
          onLongPress: () {},
          onTap: () {
            Get.to(() => const ProductDetailPage());
          },
          child: cardProductGridView(
              needFavoritIcon: false,
              urlImage: 'assets/images/example.jpg',
              onPressedFavorit: () {},
              productName: "Daster kain katun",
              productPrice: 50000),
        ),
      ),
    );
  }
}
