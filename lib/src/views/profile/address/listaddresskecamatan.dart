import 'package:craftgirlsss/src/controllers/GetxController/address_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:craftgirlsss/src/views/profile/address/listaddresspostalcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfAddressKecamatan extends StatefulWidget {
  const ListOfAddressKecamatan({super.key, this.idProvince, this.idKabupaten});
  final String? idProvince, idKabupaten;

  @override
  State<ListOfAddressKecamatan> createState() => _ListOfAddressKecamatanState();
}

class _ListOfAddressKecamatanState extends State<ListOfAddressKecamatan> {
  AddressController addressC = Get.put(AddressController());

  @override
  void initState() {
    addressC.getKecamatan(context,
        idKabupaten: widget.idKabupaten, idProvince: widget.idProvince);
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
          Text('  Kecamatan',
              style: sfPro(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.normal)),
          const SizedBox(height: 10),
          Obx(() => addressC.isLoadingGetDesa.value == true
              ? kLoading()
              : addressC.kecamatanModels.value!.rajaongkir.results.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            addressC.kecamatanName.value = addressC
                                .kecamatanModels
                                .value!
                                .rajaongkir
                                .results[index]
                                .subdistrictName;
                            Get.to(() => const ListOfAddressPostalCode());
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
                                  addressC.kecamatanModels.value!.rajaongkir
                                      .results[index].subdistrictName,
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
                          .kecamatanModels.value!.rajaongkir.results.length)
                  : const Center(
                      child: Text('Gagal memuat data'),
                    ))
        ],
      ),
    );
  }
}
