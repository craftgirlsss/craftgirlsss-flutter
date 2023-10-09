import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/containers/descriptions/descriptions.dart';
import 'package:craftgirlsss/src/view-models/containers/ongkirdetail/ongkoskirim.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/modalbottom/modalbottomsheet.dart';
import 'package:craftgirlsss/src/view-models/ratingsstatus/ratingproductstatus.dart';
import 'package:craftgirlsss/src/view-models/reviews/productreview.dart';
import 'package:craftgirlsss/src/view-models/specifcation/containerspecification.dart';
// import 'package:craftgirlsss/src/views/products/conversations/chat.dart';
import 'package:craftgirlsss/src/views/products/productreviews/productreviews.dart';
import 'package:craftgirlsss/src/views/profile/addresses.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: Colors.white,
      appBar: kAppBar(context,
          withLeadingData: true,
          listData: [
            IconButton(
                onPressed: () {
                  // Get.to(() => const ChatPage());
                },
                tooltip: 'Chat admin',
                icon: Image.asset(
                  'assets/icons/chat.png',
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Text('Error')),
                  scale: 0.7,
                ))
          ],
          autoImplyLeading: true,
          isTitle: true,
          titleText: "Detail Produk"),
      body: ListView(
        physics: const ScrollPhysics(),
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
                    enlargeCenterPage: false,
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
          const Divider(),
          kProductSpecification(context, onTap: () {
            showProductSpecification(context);
          }),
          const Divider(),
          kOngkir(
              onTap: () {
                showProductOngkir(context,
                    endDate: "2",
                    kabupaten: "Sidoarjo",
                    month: "September", onTapLocationName: () {
                  Get.to(() => const LokasiPengiriman());
                }, priceOngkir: 12000, startDate: '1', tipeOngkir: 'Reguler');
              },
              endDate: "2",
              startDate: '1',
              ongkir: 12000,
              month: 'September'),
          const Divider(),
          kDescription(context,
              description:
                  "fakjbdkjadkjbfkjsbfbsdkjbcksdbkjdsbfkjsd h bfsdnfkjjfkebfjksbfdkjskfskbfkbfakjbdkjadkjbfkjsbfbsdkjbcksdbkjdsbfkjsd h bfsdnfkjjfkebfjksbfdkjskfskbfkbfakjbdkjadkjbfkjsbfbsdkjbcksdbkjdsbfkjsd h bfsdnfkjjfkebfjksbfdkjskfskbfkbfakjbdkjadkjbfkjsbfbsdkjbcksdbkjdsbfkjsd h bfsdnfkjjfkebfjksbfdkjskfskbfkbfakjbdkjadkjbfkjsbfbsdkjbcksdbkjdsbfkjsd h bfsdnfkjjfkebfjksbfdkjskfskbfkbfakjbdkjadkjbfkjsbfbsdkjbcksdbkjdsbfkjsd h bfsdnfkjjfkebfjksbfdkjskfskbfkbfakjbdkjadkjbfkjsbfbsdkjbcksdbkjdsbfkjsd h bfsdnfkjjfkebfjksbfdkjskfskbfkb"),
          const Divider(),
          kTileUlasan(context, onPressed: () {
            Get.to(() => const PrductReviews());
          }, rating: 4.5),
          ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) => productReview(
                    context,
                    commentatorName: "Regard",
                    imageURLDescription: [
                      'https://googleflutter.com/sample_image.jpg'
                    ],
                    reasons:
                        'dhkjhdfshfuiwehfesihfjcksfhewhfnckcdshiuerfdghjagdkasbdafkajsbdkasbdbaskjfbkasbdkaguadkjcakbdiwedjkbcksb',
                    starCount: 3,
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 2),
          const SizedBox(height: 70)
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
              width: 140,
              child: kButtons(context,
                  label: "Beli sekarang",
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
