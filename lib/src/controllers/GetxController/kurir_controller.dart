import 'package:craftgirlsss/src/models/kurirmodels/kurirmodels.dart';
import 'package:get/get.dart';
import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;

class KurirController extends GetxController {
  var isLoading = false.obs;
  var modelsKurir = <KurirModels>[].obs;

  @override
  void onInit() {
    fetchKurirName();
    super.onInit();
  }

  fetchKurirName() async {
    isLoading.value = true;
    try {
      List resultProfilesDetail = await vars.client
          .from('cr_daftar_kurir')
          .select('*')
          .eq('deleted', false);
      // print(resultProfilesDetail);
      modelsKurir.value =
          resultProfilesDetail.map((e) => KurirModels.fromJson(e)).toList();
      isLoading.value = false;
    } catch (e) {
      // print(e);
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
