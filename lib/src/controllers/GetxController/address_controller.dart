import 'dart:convert';

import 'package:craftgirlsss/src/models/addressmodels/addressmodels.dart';
import 'package:craftgirlsss/src/models/addressmodels/provincemodels.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  var isLoadingInsert = false.obs;
  var isLoadingGetProvince = false.obs;
  var isLoadingGetKabupaten = false.obs;
  var isLoadingGetDesa = false.obs;
  var isLoadingLoadData = false.obs;
  var id = vars.client.auth.currentUser?.id;
  var addressCount = 0.obs;
  var addressesModelsList = <AddressesModels>[].obs;
  var provinceModels = Rxn<ProvinceModels>();
  var itemDefault = 0.obs;
  var idDefault = 0.obs;

  fetchAllAddress(context) async {
    isLoadingLoadData.value = true;
    try {
      List data = await vars.client
          .from('cr_addresses')
          .select('*')
          .eq("user_uuid", id);
      // print(data);
      addressCount.value = data.length;
      addressesModelsList.value =
          data.map((e) => AddressesModels.fromJson(e)).toList();
      List isDefaultMoreThanOne = await vars.client
          .from('cr_addresses')
          .select('*')
          .eq('user_uuid', id)
          .eq('deleted', false)
          .eq('is_default', true);
      // print("ini length dari default ${isDefaultMoreThanOne.length}");
      // print(
      //     "Ini id address yang ada default nya ${isDefaultMoreThanOne[0]['id']}");
      idDefault.value = isDefaultMoreThanOne[0]['id'];
      itemDefault.value = isDefaultMoreThanOne.length;
    } catch (e) {
      debugPrint(e.toString());
      isLoadingLoadData.value = false;
      // kAlertGagal(context, title: e.toString());
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
      // print(e);
      kAlertGagal(context, title: e.toString());
    }
    isLoadingInsert.value = false;
  }

  getProvince() async {
    try {
      isLoadingGetProvince(true);
      http.Response response = await http.get(
          Uri.tryParse("https://pro.rajaongkir.com/api/province")!,
          headers: {'key': 'e049d10db2bd7fc4d5ec3cb4035633be'});
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        provinceModels.value = ProvinceModels.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      // print('Error while getting data is $e');
    } finally {
      isLoadingGetProvince(false);
    }
  }
}
