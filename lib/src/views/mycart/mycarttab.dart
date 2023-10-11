import 'package:craftgirlsss/src/helpers/paddings/defaultpadding.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/containers/cardproduct/cardproductv2.dart';
import 'package:craftgirlsss/src/views/products/productdetail/productdetailcheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartProduct extends StatefulWidget {
  const MyCartProduct({super.key});

  @override
  State<MyCartProduct> createState() => _MyCartProductState();
}

class _MyCartProductState extends State<MyCartProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(context,
          autoImplyLeading: false, isTitle: true, titleText: 'Keranjangku'),
      body: ListView(
        padding: kDefaultPadding(),
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => CardProductForMyCart(
                  productPrice: 15000,
                  productName: 'Baju Favorit',
                  index: index,
                  onPressed: () {},
                  rating: 4.5,
                  urlImage: 'assets/images/sampel-1.jpeg'),
              // cardProductForCart(context,
              //         index: index, onAdd: () {}, onPressed: () {
              //       Get.to(() => const ProductDetailPage());
              //     },
              //         onFavorite: () {},
              //         productName: 'Baju favorit',
              //         productPrice: 225000,
              //         urlImage: 'assets/images/sampel-1.jpeg',
              //         ratings: 4.5),
              separatorBuilder: (context, index) => const SizedBox(height: 7),
              itemCount: 5),
        ],
      ),
    );
  }
}
