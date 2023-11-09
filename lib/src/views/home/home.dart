import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbarhome.dart';
import 'package:craftgirlsss/src/view-models/containers/cardproduct/cardproductv3.dart';
import 'package:craftgirlsss/src/view-models/containers/categoryproduct/categoryproduct.dart';
// import 'package:craftgirlsss/src/view-models/containers/flashsale/flashsale.dart';
import 'package:craftgirlsss/src/view-models/containers/footer/footer.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  final ScrollController _sliverScrollController = ScrollController();
  var isPinned = false;
  int lengthNotifications = 0;
  int lengthFavorite = 0;
  int indexImage = 0;

  @override
  void initState() {
    super.initState();
    _sliverScrollController.addListener(() {
      if (!isPinned &&
          _sliverScrollController.hasClients &&
          _sliverScrollController.offset > 70) {
        setState(() {
          isPinned = true;
        });
      } else if (isPinned &&
          _sliverScrollController.hasClients &&
          _sliverScrollController.offset < 70) {
        setState(() {
          isPinned = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Scaffold(
              body: CustomScrollView(
                controller: _sliverScrollController,
                slivers: [
                  SliverAppBar(
                    leadingWidth: 0,
                    titleSpacing: 9,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Transform.translate(
                      offset: const Offset(-15, 0),
                    ),
                    title: SizedBox(
                      height: 35,
                      child: TextField(
                        controller: controller,
                        style:
                            sfPro(fontSize: 14, color: Colors.orange.shade700),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: InputBorder.none,
                          hintText: "Cari",
                          hintStyle: sfPro(color: Colors.orange.shade700),
                          suffixIcon:
                              Image.asset('assets/icons/freshicons/camera.png'),
                          prefixIcon: Image.asset(
                            'assets/icons/freshicons/search.png',
                            scale: 1.1,
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      Center(
                        child: GestureDetector(
                            onTap: () {
                              // Get.to(() => const FavoritePage());
                            },
                            child: lengthFavorite < 1
                                ? Image.asset(
                                    'assets/icons/freshicons/${isPinned == true ? "card-orange" : "cart"}.png')
                                : badges.Badge(
                                    position: badges.BadgePosition.custom(
                                        start: 10, bottom: 10),
                                    badgeStyle: const badges.BadgeStyle(
                                      borderSide:
                                          BorderSide(color: Colors.black54),
                                      padding: EdgeInsets.all(5),
                                    ),
                                    badgeContent: Text(
                                      lengthFavorite.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                    child: isPinned == true
                                        ? Image.asset(
                                            'assets/icons/freshicons/card-orange.png')
                                        : Image.asset(
                                            'assets/icons/freshicons/cart.png'))),
                      ),
                      const SizedBox(width: 15),
                      Center(
                        child: GestureDetector(
                            // tooltip: 'Favorit',
                            onTap: () {},
                            child: lengthNotifications < 1
                                ? Image.asset(
                                    'assets/icons/freshicons/${isPinned == true ? "chats-orange" : "chats"}.png')
                                : badges.Badge(
                                    position: badges.BadgePosition.custom(
                                        start: 10, bottom: 10),
                                    badgeStyle: const badges.BadgeStyle(
                                      borderSide:
                                          BorderSide(color: Colors.black54),
                                      padding: EdgeInsets.all(5),
                                    ),
                                    badgeContent: Text(
                                      lengthNotifications.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                    child: isPinned == true
                                        ? Image.asset(
                                            'assets/icons/freshicons/chats-orange.png')
                                        : Image.asset(
                                            'assets/icons/freshicons/chats.png'))),
                      ),
                      const SizedBox(width: 10),
                    ],
                    pinned: true,
                    floating: true,
                    snap: false,
                    expandedHeight: 170,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          CarouselSlider(
                            items: listItemStaredImages.map((e) {
                              return GestureDetector(
                                onTap: () {},
                                child: ClipRRect(
                                    // borderRadius: BorderRadius.circular(4),
                                    child: Image.asset(
                                  e,
                                  width: 470,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  indexImage = index;
                                });
                              },
                              height: 200,
                              enlargeCenterPage: false,
                              reverse: true,
                              autoPlay: true,
                              aspectRatio: 19 / 6,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: false,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              viewportFraction: 1,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: DotsIndicator(
                              decorator: DotsDecorator(
                                  activeColor: Colors.red,
                                  color: Colors.grey.shade300),
                              dotsCount: listItemStaredImages.length,
                              position: indexImage.toDouble(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate.fixed([
                    const SizedBox(height: 5),
                    Text(
                      '  Kategori',
                      style: sfPro(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: categoryProduct(context),
                    ),
                    Text(
                      '  Rekomendasi',
                      style: sfPro(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                  ])),
                  SliverGrid.builder(
                      itemCount: 5,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1 / 1.45,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemBuilder: (context, index) => cardProductV3(context,
                          addingDescriptionUniq: true,
                          cashbackextra: true,
                          descriptionUnique: "Produk Keren",
                          discount: true,
                          discountPercent: 10,
                          gratisOngkir: true,
                          // theBestProduct: false,
                          newProduct: true,
                          onPressed: () {},
                          onPressedButton: () {},
                          price: 120000,
                          productName:
                              "Samsung EVO 860 SSD SATA 512 GB BARU real speed read 560 mb/s write 530 mb/s",
                          productStars: true,
                          stars: 5,
                          totalBought: 1020,
                          urlImage: "assets/images/example-product.jpeg"))
                ],
              ),
            )
          ],
        ),
        // backgroundColor: Colors.white,
        // appBar: kAppBarHomeV2(
        //     lengthNotifications: 4,
        //     lengthFavorite: 1,
        //     controller: controller,
        //     onPressedCamera: () {}),
        // body: ListView(
        //   children: [
        //     CarouselSlider(
        //         items: listItemStaredImages.map((e) {
        //           return GestureDetector(
        //             onTap: () {},
        //             child: ClipRRect(
        //                 // borderRadius: BorderRadius.circular(4),
        //                 child: Image.asset(
        //               e,
        //               width: 470,
        //               height: 200,
        //               fit: BoxFit.cover,
        //             )),
        //           );
        //         }).toList(),
        //         options: CarouselOptions(
        //           height: 150,
        //           enlargeCenterPage: false,
        //           reverse: true,
        //           autoPlay: true,
        //           aspectRatio: 19 / 6,
        //           autoPlayCurve: Curves.fastOutSlowIn,
        //           enableInfiniteScroll: false,
        //           autoPlayAnimationDuration:
        //               const Duration(milliseconds: 800),
        //           viewportFraction: 1,
        //         )),
        //     const SizedBox(height: 20),

        //     Text(
        //       '  Kategori',
        //       style: title(fontSize: 22, fontWeight: FontWeight.bold),
        //     ),
        //     const SizedBox(height: 8),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        //       child: categoryProduct(context),
        //     ),
        //     Text(
        //       '  Rekomendasi',
        //       style: sfPro(fontSize: 16, fontWeight: FontWeight.bold),
        //     ),
        //     const SizedBox(height: 5),
        //     GridView.builder(
        //         padding: const EdgeInsets.only(left: 7, right: 7),
        //         physics: const ScrollPhysics(),
        //         shrinkWrap: true,
        //         gridDelegate:
        //             const SliverGridDelegateWithMaxCrossAxisExtent(
        //                 maxCrossAxisExtent: 200,
        //                 childAspectRatio: 1 / 1.45,
        //                 crossAxisSpacing: 8,
        //                 mainAxisSpacing: 8),
        //         itemCount: 5,
        //         itemBuilder: (BuildContext ctx, index) {
        //           return cardProductV3(context,
        //               addingDescriptionUniq: true,
        //               cashbackextra: true,
        //               descriptionUnique: "Produk Keren",
        //               discount: true,
        //               discountPercent: 10,
        //               gratisOngkir: true,
        //               // theBestProduct: false,
        //               newProduct: true,
        //               onPressed: () {},
        //               onPressedButton: () {},
        //               price: 120000,
        //               productName:
        //                   "Samsung EVO 860 SSD SATA 512 GB BARU real speed read 560 mb/s write 530 mb/s",
        //               productStars: true,
        //               stars: 5,
        //               totalBought: 1020,
        //               urlImage: "assets/images/example-product.jpeg");
        //         }),
        //     const SizedBox(height: 10),
        //     // const FlashSale(),
        //     // const SizedBox(height: 8),
        //     // Text(
        //     //   '  Rekomendasi',
        //     //   style: title(fontSize: 22, fontWeight: FontWeight.bold),
        //     // ),
        //     // const SizedBox(height: 8),
        //   ],
        // ),
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
