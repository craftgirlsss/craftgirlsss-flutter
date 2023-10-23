import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/ticket/ticketcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black54,
              )),
          bottom: TabBar(
            indicatorColor: Colors.green,
            indicatorWeight: 2.3,
            tabs: [
              Tab(
                  icon: Text(
                "Semua",
                style: sfPro(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              )),
              Tab(
                  icon: Text("Craftgirlsss",
                      style: sfPro(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.normal))),
              Tab(
                  icon: Text("Gratis Ongkir",
                      style: sfPro(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.normal))),
            ],
          ),
          title: Text('Voucherku',
              style: sfPro(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
        ),
        body: TabBarView(
          children: [
            // tab untuk voucher semuanya
            ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return ticketContainerGratisOngkir(context,
                        expireDate: "31 Desember 2024",
                        onPressed: () {},
                        title: "Gratis Ongkir",
                        subtitle: "Minimal belanja 0 Rupiah");
                  } else {
                    return ticketContainerCashBack(context,
                        expireDate: "31 Desember 2024",
                        onPressed: () {},
                        title: "Cashback 20%",
                        subtitle: "Minimal belanja 100 rb");
                  }
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 10),
            // tab untuk voucher dari craftgirlsss
            ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return ticketContainerCashBack(context,
                      expireDate: "31 Desember 2024",
                      onPressed: () {},
                      title: "Cashback 20%",
                      subtitle: "Minimal belanja 100 rb");
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 10),
            // tab untuk voucher dari Gratis Ongkir
            ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return ticketContainerGratisOngkir(context,
                      expireDate: "31 Desember 2024",
                      onPressed: () {},
                      title: "Gratis Ongkir",
                      subtitle: "Minimal belanja 0 Rupiah");
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 10),
          ],
        ),
      ),
    );
    // return Scaffold(
    //     appBar: defaultAppBar(title: "Edit Email", autoImplyLeading: true),
    //     body: ListView.separated(
    //         padding: const EdgeInsets.all(15),
    //         itemBuilder: (context, index) {
    //           if (index % 2 == 0) {
    //             return ticketContainerGratisOngkir(context,
    //                 expireDate: "31 Desember 2024",
    //                 onPressed: () {},
    //                 title: "Gratis Ongkir",
    //                 subtitle: "Minimal belanja 0 Rupiah");
    //           } else {
    //             return ticketContainerCashBack(context,
    //                 expireDate: "31 Desember 2024",
    //                 onPressed: () {},
    //                 title: "Cashback 20%",
    //                 subtitle: "Minimal belanja 100 rb");
    //           }
    //         },
    //         separatorBuilder: (context, index) => const SizedBox(height: 10),
    //         itemCount: 10));
  }
}
