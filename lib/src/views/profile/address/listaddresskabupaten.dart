import 'package:craftgirlsss/src/controllers/GetxController/address_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'listaddresskecamatan.dart';

class ListOfAddressKabupaten extends StatefulWidget {
  const ListOfAddressKabupaten({super.key, this.idProvince});
  final String? idProvince;
  @override
  State<ListOfAddressKabupaten> createState() => _ListOfAddressKabupatenState();
}

class _ListOfAddressKabupatenState extends State<ListOfAddressKabupaten> {
  AddressController addressC = Get.put(AddressController());

  @override
  void initState() {
    addressC.getKabupaten(context,idProvince: widget.idProvince);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: defaultAppBar(autoImplyLeading: true, title: "Pilih Kecamatan"),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Text('  Kabupaten',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.normal)),
          const SizedBox(height: 10),
          Obx(() => addressC.isLoadingGetKabupaten.value == true
              ? kLoading()
              : addressC.kabupatenModels.value!.rajaongkir.results.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //menyimpan nama kabupaten
                            addressC.kabupatenName.value = addressC
                                .kabupatenModels
                                .value!
                                .rajaongkir
                                .results[index]
                                .cityName;
                            Get.to(() => ListOfAddressKecamatan(
                                  idKabupaten: addressC.kabupatenModels.value!
                                      .rajaongkir.results[index].cityId,
                                  idProvince: addressC.kabupatenModels.value!
                                      .rajaongkir.results[index].provinceId,
                                ));
                            // addressC.idProvince.value = addressC.provinceModels
                            //     .value!.rajaongkir.results[index].provinceId;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  addressC.kabupatenModels.value!.rajaongkir
                                      .results[index].cityName,
                                  textAlign: TextAlign.start,
                                  style: titleInter(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  size: 18,
                                  color: Colors.black54,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 2),
                      itemCount: addressC
                          .kabupatenModels.value!.rajaongkir.results.length)
                  : const Center(
                      child: Text('Gagal memuat data'),
                    ))
        ],
      ),
    );
  }
}
