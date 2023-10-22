import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbarhome.dart';
import 'package:craftgirlsss/src/view-models/containers/cardproduct/cardproductv2.dart';
import 'package:craftgirlsss/src/view-models/containers/categoryproduct/categoryproduct.dart';
// import 'package:craftgirlsss/src/view-models/containers/flashsale/flashsale.dart';
import 'package:craftgirlsss/src/view-models/containers/footer/footer.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldsearch.dart';
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
    return RefreshIndicator(
      onRefresh: () async {},
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: kAppBarHome(lengthNotifications: 4, lengthFavorite: 1),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 10, bottom: 20),
                child: kSearchTextFieldHome(),
              ),
              CarouselSlider(
                  items: listItemStaredImages.map((e) {
                    return GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
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
        ),
      ),
    );
  }

  var listItemStaredImages = [
    'assets/images/banner-product-discount.jpg',
    'assets/images/banner-product-discount.jpg',
  ];

  List<Map> productsCategory = [
    {"image": "0", "name": "Komputer & Aksesoris", "onPressed": () {}},
    {"image": "1", "name": "Handphone & Aksesoris", "onPressed": () {}},
    {"image": "2", "name": "Buku & Alat Tulis", "onPressed": () {}},
    {"image": "3", "name": "Alat Elektronik", "onPressed": () {}},
    {"image": "4", "name": "Fashion & Aksesoris", "onPressed": () {}},
    {"image": "5", "name": "Busana Muslim", "onPressed": () {}},
    {"image": "6", "name": "Kesehatan dan Obat", "onPressed": () {}},
    {"image": "7", "name": "Olahraga & Outdoor", "onPressed": () {}},
    {"image": "8", "name": "Otomotif", "onPressed": () {}},
    {"image": "9", "name": "Fashion Anak", "onPressed": () {}},
    {"image": "10", "name": "Baju Pria", "onPressed": () {}},
    {"image": "11", "name": "Baju Wanita", "onPressed": () {}},
    {"image": "12", "name": "Perabotan Rumah", "onPressed": () {}},
    {"image": "13", "name": "Alat Kerja", "onPressed": () {}},
    {"image": "14", "name": "Sepatu Pria", "onPressed": () {}},
    {"image": "15", "name": "Sepatu Wanita", "onPressed": () {}},
    {"image": "16", "name": "Snack", "onPressed": () {}},
    {"image": "17", "name": "Tas Pria", "onPressed": () {}},
    {"image": "18", "name": "Tas Wanita", "onPressed": () {}},
    {"image": "19", "name": "Gift", "onPressed": () {}},
  ];
}
