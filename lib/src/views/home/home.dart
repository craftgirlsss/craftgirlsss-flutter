import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbarhome.dart';
import 'package:craftgirlsss/src/view-models/containers/cardproduct/cardproductv2.dart';
import 'package:craftgirlsss/src/view-models/containers/categoryproduct/categoryproduct.dart';
// import 'package:craftgirlsss/src/view-models/containers/flashsale/flashsale.dart';
import 'package:craftgirlsss/src/view-models/containers/footer/footer.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/products/productdetail/productdetailcheckout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: kAppBarHome(),
      body: ListView(
        children: [
          CarouselSlider(
              items: listItemStaredImages.map((e) {
                return GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        e,
                        width: 470,
                        height: 200,
                        fit: BoxFit.cover,
                      )),
                );
              }).toList(),
              options: CarouselOptions(
                height: 150,
                enlargeCenterPage: true,
                reverse: true,
                autoPlay: true,
                aspectRatio: 19 / 6,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.7,
              )),
          const SizedBox(height: 20),
          Text(
            '  Kategori',
            style: title(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: categoryProduct(context),
          ),
          Text(
            '  Koleksi Terbaik',
            style: title(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          AnimationLimiter(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 5,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return cardProductV2(context, index: index, onAdd: () {},
                    onPressed: () {
                  Get.to(() => const ProductDetailPage());
                },
                    onFavorite: () {},
                    productName: 'Baju favorit',
                    productPrice: 225000,
                    urlImage: 'assets/images/sampel-1.jpeg',
                    ratings: 4.5);
                // return kCardProduct(onTap: () {}, productName: "Dress Viral");
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ),

          const SizedBox(height: 10),
          // const FlashSale(),
          // const SizedBox(height: 8),
          // Text(
          //   '  Rekomendasi',
          //   style: title(fontSize: 22, fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(height: 8),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: GridView.builder(
          //       shrinkWrap: true,
          //       physics: const ScrollPhysics(),
          //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //           maxCrossAxisExtent: 250,
          //           childAspectRatio: 1 / 1.4,
          //           crossAxisSpacing: 8,
          //           mainAxisSpacing: 8),
          //       itemCount: 11,
          //       itemBuilder: (BuildContext ctx, index) {
          //         return cardProductGridView(
          //             needFavoritIcon: true,
          //             urlImage: 'assets/images/example.jpg',
          //             onPressedFavorit: () {},
          //             productName: "Daster",
          //             productPrice: 50000);
          //       }),
          // ),
          footer(context)
        ],
      ),
    );
  }

  var listItemStaredImages = [
    'assets/images/banner-product-discount.jpg',
    'assets/images/banner-product-discount.jpg',
  ];
}
