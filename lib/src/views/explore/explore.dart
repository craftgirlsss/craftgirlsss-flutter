import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftgirlsss/src/view-models/containers/cardproduct/cardproductv2.dart';
import 'package:craftgirlsss/src/views/products/productdetail/productdetailcheckout.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[createSilverAppBar1(), createSilverAppBar2()];
          },
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: 5,
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
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          ),
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: Colors.green.shade200,
      expandedHeight: 180,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Container(
            color: Colors.white,
            child: Stack(
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
            // Image.asset(
            //   'assets/images/sampel-1.jpeg',
            //   fit: BoxFit.cover,
            // ),
          ),
        );
      }),
    );
  }

  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
      backgroundColor: Colors.green.shade200,
      pinned: true,
      elevation: 0,
      title: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 44,
        decoration: const BoxDecoration(),
        child: CupertinoTextField(
          controller: searchController,
          keyboardType: TextInputType.text,
          placeholder: 'Cari',
          placeholderStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: 'Brutal',
          ),
          prefix: const Padding(
            padding: EdgeInsets.fromLTRB(13.0, 5.0, 0.0, 5.0),
            child: Icon(
              Icons.search,
              size: 18,
              color: Colors.black,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black38),
            color: Colors.grey.shade200,
          ),
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
