import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/containers/cardproduct/cardproductv2.dart';
import 'package:craftgirlsss/src/view-models/containers/cardtotalproduct/totalpriceproduct.dart';
import 'package:flutter/material.dart';

class MyCartProduct extends StatefulWidget {
  const MyCartProduct({super.key});

  @override
  State<MyCartProduct> createState() => _MyCartProductState();
}

class _MyCartProductState extends State<MyCartProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Keranjangku"),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
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
                  ukuran: "XL",
                  urlImage: 'assets/images/sampel-1.jpeg'),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 5),
          const SizedBox(height: 10),
          totalPriceProductCheckOut(context,
              biayaLainnya: 0, discount: 0, grandTotal: 0, orderTotal: 0),
          const SizedBox(height: 10),
          Center(
            child: kButtons(context,
                backgroundColor: Colors.green.shade400,
                label: "Checkout",
                onPressed: () {},
                fonSize: 16,
                withIcon: true,
                icons: Icons.shopping_cart_checkout),
          )
        ],
      ),
    );
  }
}
