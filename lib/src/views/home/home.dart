import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftgirlsss/src/view-models/containers/cardproduct/cardproductv3.dart';
import 'package:craftgirlsss/src/view-models/containers/container-icons/containericons.dart';
import 'package:craftgirlsss/src/view-models/containers/containersnextpay/containernextpay.dart';
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
          _sliverScrollController.offset > 150) {
        setState(() {
          isPinned = true;
        });
      } else if (isPinned &&
          _sliverScrollController.hasClients &&
          _sliverScrollController.offset < 150) {
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
        child: Scaffold(
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
                    style: sfPro(fontSize: 14, color: Colors.orange.shade900),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: InputBorder.none,
                      hintText: "Cari",
                      hintStyle: sfPro(color: Colors.orange.shade900),
                      suffixIcon: const Icon(Icons.camera_alt_outlined),
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
                                  borderSide: BorderSide(color: Colors.black54),
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
                                  borderSide: BorderSide(color: Colors.black54),
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
                expandedHeight: 309,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              CarouselSlider(
                                items: listItemStaredImages.map((e) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: ClipRRect(
                                        // borderRadius: BorderRadius.circular(4),
                                        child: Image.asset(
                                      e,
                                      // width: 470,
                                      height: 210,
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
                                  height: 210,
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
                                bottom: 30,
                                left: 0,
                                right: 0,
                                child: DotsIndicator(
                                  decorator: DotsDecorator(
                                      spacing: const EdgeInsets.all(4),
                                      size: const Size(7, 7),
                                      activeSize: const Size(7, 7),
                                      activeColor: Colors.red,
                                      color: Colors.grey.shade300),
                                  dotsCount: listItemStaredImages.length,
                                  position: indexImage.toDouble(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          containerIconsCategory()
                        ],
                      ),
                      Positioned(
                          bottom: 85,
                          left: 0,
                          right: 0,
                          child: containerNextPay(context)),
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 1,
                              color: Colors.black12,
                              offset: Offset(0, 1))
                        ],
                        borderRadius: BorderRadius.circular(3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(7),
                                  bottomRight: Radius.circular(7))),
                          child: Text(
                            "ZONA PENGGUNA BARU",
                            style: sfPro(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "EKSKLUSIF UNTUK PENGGUNA BARU",
                              style: sfPro(
                                  color: Colors.orange.shade900,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.orange.shade900,
                              size: 19,
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                                width: 0.4,
                              ),
                              color: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 70,
                                    width: 90,
                                    color: const Color.fromARGB(
                                        255, 105, 189, 108),
                                    child: Center(
                                      child: Text(
                                        "GRATIS ONGKIR",
                                        textAlign: TextAlign.center,
                                        style: sfPro(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Min. Belanja Rp 0",
                                          style: sfPro(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 3),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(1),
                                              border: Border.all(
                                                  color: Colors.red.shade700,
                                                  width: 0.5),
                                              color: Colors.white),
                                          child: Text(
                                            'Pengguna Baru',
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            style: sfPro(
                                                color: Colors.red.shade700,
                                                fontSize: 10),
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          "Berlaku 180 Hari",
                                          style: sfPro(
                                              color: Colors.black54,
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                    width: 60,
                                    height: 27,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.orange.shade900,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Center(
                                        child: Text(
                                      "Lihat",
                                      style: sfPro(
                                          color: Colors.white, fontSize: 12),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  '  Rekomendasi',
                  style: sfPro(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
              ])),
              SliverGrid.builder(
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
        ),
      ),
    );
  }

  var listItemStaredImages = [
    'assets/images/banner-product-discount.jpg',
    'assets/images/banner-product-discount.jpg',
  ];
}
