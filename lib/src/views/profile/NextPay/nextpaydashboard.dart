import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/helpers/paddings/defaultpadding.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/containers/cardmenunextpay/cardmenu.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPayDashboard extends StatefulWidget {
  const NextPayDashboard({super.key});

  @override
  State<NextPayDashboard> createState() => _NextPayDashboardState();
}

class _NextPayDashboardState extends State<NextPayDashboard> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
          centerTitle: false,
          autoImplyLeading: true,
          title: "NextPay",
          withActions: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: InkWell(
                onTap: () {},
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.7), BlendMode.color),
                  child: Image.asset(
                    'assets/icons/freshicons/qris.png',
                    width: 50,
                    height: 30,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              width: 40,
              height: 40,
              child: InkWell(
                onTap: () {},
                child: Image.asset('assets/icons/freshicons/InfoV2.png'),
              ),
            ),
            Container(
              color: Colors.transparent,
              width: 40,
              height: 40,
              child: InkWell(
                onTap: () {},
                child: Image.asset('assets/icons/freshicons/Gear.png'),
              ),
            ),
          ]),
      body: ListView(
        padding: kDefaultPadding(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                    formatCurrency.format(
                        profileController.profileModels[0].nextPayWallet),
                    style: sfPro(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
              Obx(() => Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/freshicons/coins-colors.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          profileController.profileModels[0].nextPayWallet
                              .toString(),
                          style: sfPro(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black45),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 14,
                          color: Colors.black45,
                        )
                      ],
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 14),
          cardMenuNextPay(context),
          const SizedBox(height: 20),
          Text(
            "Transaksi terakhir",
            style: sfPro(
                color: Colors.black54,
                fontSize: 17,
                fontWeight: FontWeight.normal),
          ),
          const Divider(color: Colors.black54),
          ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) => Text(index.toString()),
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.black45),
              itemCount: 10)
        ],
      ),
    );
  }
}
