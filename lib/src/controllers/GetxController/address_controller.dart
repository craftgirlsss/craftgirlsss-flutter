import 'package:craftgirlsss/src/models/addressmodels/addressmodels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;

class AddressController extends GetxController {
  var isLoadingInsert = false.obs;
  var isLoadingGetProvince = false.obs;
  var isLoadingGetKabupaten = false.obs;
  var isLoadingGetDesa = false.obs;
  var isLoadingLoadData = false.obs;
  var id = vars.client.auth.currentUser?.id;
  var addressCount = 0.obs;
  var addressesModelsList = <AddressesModels>[].obs;
  var itemDefault = 0.obs;
  var idDefault = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // fetchAllAddress();
  }

  fetchAllAddress() async {
    isLoadingLoadData.value = true;
    try {
      List data = await vars.client
          .from('cr_addresses')
          .select('*')
          .eq("user_uuid", id);
      print(data);
      addressCount.value = data.length;
      addressesModelsList.value =
          data.map((e) => AddressesModels.fromJson(e)).toList();
      List isDefaultMoreThanOne = await vars.client
          .from('cr_addresses')
          .select('*')
          .eq('user_uuid', id)
          .eq('deleted', false)
          .eq('is_default', true);
      print("ini length dari default ${isDefaultMoreThanOne.length}");
      print(
          "Ini id address yang ada default nya ${isDefaultMoreThanOne[0]['id']}");
      idDefault.value = isDefaultMoreThanOne[0]['id'];
      itemDefault.value = isDefaultMoreThanOne.length;
    } catch (e) {
      debugPrint(e.toString());
      isLoadingLoadData.value = false;
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Gagal mendapatkan alamat',
      //         style: TextStyle(color: Colors.white)),
      //     backgroundColor: Colors.red));
    }
    isLoadingLoadData.value = false;
  }

  insertAddress(context,
      {namaPenerima,
      nomorHpPenerima,
      kabupaten,
      province,
      desa,
      fullAddress,
      postalCode,
      detailLainnya,
      aturSebagai,
      isdefault = false}) async {
    isLoadingInsert.value = true;
    try {
      if (isdefault == true) {
        await vars.client
            .from('cr_addresses')
            .update({"is_default": false}).eq('user_uuid', id);
      }
      if (addressCount.value == 0) {
        isdefault = true;
      }
      await vars.client.from('cr_addresses').insert(
        {
          'user_uuid': id,
          'province_name': province,
          'city_name': kabupaten,
          'vilages_name': desa,
          'full_address': fullAddress,
          'postal_code': postalCode,
          'detail_lainnya': detailLainnya,
          'atur_sebagai': aturSebagai,
          'is_default': isdefault,
          'nama_penerima': namaPenerima,
          'nomor_hp_penerima': nomorHpPenerima
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Sukses menambahkan alamat',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print(e);
      isLoadingInsert.value = false;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Gagal menambahkan alamat',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red));
    }
    isLoadingInsert.value = false;
  }
}
