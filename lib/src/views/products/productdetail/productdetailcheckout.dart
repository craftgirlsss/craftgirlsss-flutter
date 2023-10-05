import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/modalbottom/modalbottomsheet.dart';
import 'package:craftgirlsss/src/view-models/ratingsstatus/ratingproductstatus.dart';
import 'package:craftgirlsss/src/view-models/specifcation/containerspecification.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffcb9),
      appBar: kAppBar(context,
          autoImplyLeading: true, isTitle: true, titleText: "Detail Produk"),
      body: ListView(
        children: [
          Stack(
            children: [
              CarouselSlider(
                  items: imageSample.map((e) {
                    return GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            "assets/images/$e",
                            width: 470,
                            height: 200,
                            fit: BoxFit.cover,
                          )),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    pageSnapping: true,
                    height: 250,
                    enlargeCenterPage: true,
                    reverse: false,
                    autoPlay: true,
                    aspectRatio: 19 / 6,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 1,
                  )),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width / 3,
                child: DotsIndicator(
                  decorator: const DotsDecorator(
                      activeShape: OutlineInputBorder(),
                      shape: OutlineInputBorder(),
                      activeColor: Colors.red,
                      color: Colors.white),
                  dotsCount: imageSample.length,
                  position: currentIndex.toDouble(),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            color: const Color(0xfffffcb9),
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Sweeter 3Second all size",
                    overflow: TextOverflow.ellipsis,
                    style: titleInter(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
          ratingRow(context,
              onTapFavofite: () {},
              onTapShare: () {},
              rating: 4.5,
              soldCount: 2356),
          const SizedBox(height: 3),
          kProductSpecification(context, onTap: () {
            showProductSpecification(context);
          }),
          const SizedBox(height: 10),
        ],
      ),
      bottomSheet: Container(
        color: const Color(0xfffffcb9),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatCurrency.format(1200000),
                style: titleInter(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Flexible(
                child: SizedBox(
              height: 40,
              width: 100,
              child: kButtons(context,
                  label: "Checkout",
                  backgroundColor: Colors.green.shade400,
                  onPressed: () {}),
            ))
          ],
        ),
      ),
    );
  }

  List imageSample = [
    'sampel-1.jpeg',
    'sampel-2.jpeg',
    'sampel-3.jpg',
    'sampel-4.jpeg',
    'sampel-5.jpg'
  ];
}
