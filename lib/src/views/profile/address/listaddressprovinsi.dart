import 'package:craftgirlsss/src/controllers/GetxController/address_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:craftgirlsss/src/views/profile/address/listaddresskabupaten.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfAddressProvince extends StatefulWidget {
  const ListOfAddressProvince({super.key});

  @override
  State<ListOfAddressProvince> createState() => _ListOfAddressProvinceState();
}

class _ListOfAddressProvinceState extends State<ListOfAddressProvince> {
  AddressController addressC = Get.put(AddressController());

  @override
  void initState() {
    addressC.getProvince(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: defaultAppBar(autoImplyLeading: true, title: "Pilih Provinsi"),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Text('  Provinsi',
              style: sfPro(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.normal)),
          const SizedBox(height: 10),
          Obx(() => addressC.isLoadingGetProvince.value == true
              ? kLoading()
              : addressC.addressesModelsList.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // menyimpan id province
                            addressC.provinceName.value = addressC
                                .provinceModels
                                .value!
                                .rajaongkir
                                .results[index]
                                .province;
                            Get.to(() => ListOfAddressKabupaten(
                                idProvince: addressC.provinceModels.value!
                                    .rajaongkir.results[index].provinceId));
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
                                  addressC.provinceModels.value!.rajaongkir
                                      .results[index].province,
                                  textAlign: TextAlign.start,
                                  style: sfPro(
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
                          .provinceModels.value!.rajaongkir.results.length)
                  : const Center(
                      child: Text('Gagal memuat data'),
                    ))
        ],
      ),
    );
  }
}
