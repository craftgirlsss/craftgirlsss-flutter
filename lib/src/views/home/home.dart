import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/backgrounds/backgroundimage/backgroundimage.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/profile/profile.dart';
import 'package:flutter/material.dart';
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
      appBar: kAppBar(context, onTapProfile: () {
        Get.to(() => const ProfileTab());
      },
          withLeadingData: false,
          withLeadingImage: true,
          isTitle: true,
          titleText: "Beranda",
          autoImplyLeading: false),
      body: Stack(
        children: [
          kBackgroundImage(context, urlAsset: 'assets/images/bg-imagine.jpg'),
          ListView(
            children: [
              Center(
                child: Text(
                  "Koleksi Baru",
                  style: title(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Dengan diskon 15%",
                  style: title(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              // containerDiscount(context, urlImage: '')
            ],
          )
        ],
      ),
    );
  }
}
