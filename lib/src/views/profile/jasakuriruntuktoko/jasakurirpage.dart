import 'package:craftgirlsss/src/controllers/GetxController/kurir_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/failedgetdata/failedgetdata.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JasaKurirPage extends StatefulWidget {
  const JasaKurirPage({super.key});

  @override
  State<JasaKurirPage> createState() => _JasaKurirPageState();
}

class _JasaKurirPageState extends State<JasaKurirPage> {
  final kurirController = Get.find<KurirController>();

  List regulerKurir = [];
  List hematKurir = [];
  List kargoKurir = [];
  List samedayKurir = [];
  List nextdayKurir = [];

  @override
  void initState() {
    for (int i = 0; i < kurirController.modelsKurir.length; i++) {
      if (kurirController.modelsKurir[i].status == "Reguler") {
        regulerKurir.add(kurirController.modelsKurir[i].name);
      } else if (kurirController.modelsKurir[i].status == "Hemat") {
        hematKurir.add(kurirController.modelsKurir[i].name);
      } else if (kurirController.modelsKurir[i].status == "Kargo") {
        kargoKurir.add(kurirController.modelsKurir[i].name);
      } else if (kurirController.modelsKurir[i].status == "Same Day") {
        samedayKurir.add(kurirController.modelsKurir[i].name);
      } else if (kurirController.modelsKurir[i].status == "Next Day") {
        nextdayKurir.add(kurirController.modelsKurir[i].name);
      } else {
      debugPrint("error");
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: RefreshIndicator(
        onRefresh: () async {
          kurirController.fetchKurirName();
        },
        child: Scaffold(
            appBar: defaultAppBar(
                autoImplyLeading: true, title: "Pengaturan Jasa Kirim Toko"),
            body: Obx(() => kurirController.isLoading.value == true
                ? kLoading()
                : kurirController.modelsKurir.isNotEmpty
                    ? ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          ListTile(
                            onTap: () {},
                            title: Text("Atur alamat toko",
                                style: sfPro(fontSize: 14)),
                            subtitle: Text("Atur alamat toko anda",
                                style:
                                    sfPro(color: Colors.black54, fontSize: 12)),
                            trailing: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Colors.black54),
                            tileColor: Colors.white,
                            dense: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const SizedBox(height: 5),
                          Text("Reguler (Cashless)",
                              style: sfPro(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) => ListTilesKurir(
                                    kurirName: regulerKurir[index],
                                    index: index,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 5),
                              itemCount: regulerKurir.length),
                          const SizedBox(height: 10),
                          Text("Hemat",
                              style: sfPro(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) => ListTilesKurir(
                                    kurirName: regulerKurir[index],
                                    index: index,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 5),
                              itemCount: hematKurir.length),
                          const SizedBox(height: 10),
                          Text("Kargo",
                              style: sfPro(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) => ListTilesKurir(
                                    kurirName: regulerKurir[index],
                                    index: index,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 5),
                              itemCount: kargoKurir.length),
                          const SizedBox(height: 10),
                          Text("Same Day",
                              style: sfPro(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) => ListTilesKurir(
                                    kurirName: regulerKurir[index],
                                    index: index,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 5),
                              itemCount: samedayKurir.length),
                          const SizedBox(height: 10),
                          Text("Next Day",
                              style: sfPro(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) => ListTilesKurir(
                                    kurirName: regulerKurir[index],
                                    index: index,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 5),
                              itemCount: nextdayKurir.length),
                          const SizedBox(height: 10),
                        ],
                      )
                    : kFailedGetInformation())),
      ),
    );
  }
}

class ListTilesKurir extends StatefulWidget {
  final String? kurirName;
  final int? index;
  const ListTilesKurir({super.key, this.kurirName, this.index});

  @override
  State<ListTilesKurir> createState() => _ListTilesKurirState();
}

class _ListTilesKurirState extends State<ListTilesKurir> {
  KurirController controller = Get.find<KurirController>();
  var useKurir = false.obs;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(widget.kurirName!, style: sfPro(fontSize: 12)),
                  IconButton(
                      splashRadius: 5,
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.info,
                        color: Colors.grey.shade300,
                        size: 15,
                      ))
                ],
              ),
            ),
            Obx(
              () => Switch(
                value: useKurir.value,
                onChanged: (value) {
                  useKurir.value = !useKurir.value;
                  debugPrint("index ${widget.index} = $value");
                },
                activeColor: Colors.green.shade700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
