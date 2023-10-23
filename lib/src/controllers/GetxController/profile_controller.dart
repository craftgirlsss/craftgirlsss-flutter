import 'dart:io';
import 'package:craftgirlsss/src/models/profilemodels/profilemodels.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:get/get.dart';
import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  var isLoadingProfilePage = false.obs;
  var isLoadingUploadImage = false.obs;
  var profileModels = <ProfileModels>[].obs;
  var urlPhotoSupabase = ''.obs;
  var id = vars.client.auth.currentUser?.id;
  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  fetchProfile() async {
    isLoadingProfilePage.value = true;
    try {
      List resultProfilesDetail = await vars.client
          .from('cr_profiles')
          .select('*, cr_toko(nama)')
          .eq('user_uuid', id);
      print(resultProfilesDetail);
      profileModels.value =
          resultProfilesDetail.map((e) => ProfileModels.fromJson(e)).toList();
      isLoadingProfilePage.value = false;
    } catch (e) {
      print(e);
      isLoadingProfilePage.value = false;
    }
    isLoadingProfilePage.value = false;
  }

  // updateProfile({
  //   String? email,
  // }) async {
  //   isLoadingProfilePage.value = true;
  //   try {
  //     List resultProfilesDetail =
  //         await vars.client.from('cr_profiles').select('*').eq('user_uuid', id);
  //     if (resultProfilesDetail.isNotEmpty) {
  //       // await vars.client.from('cr_profiles').update(values)
  //     }
  //     isLoadingProfilePage.value = false;
  //   } catch (e) {
  //     isLoadingProfilePage.value = false;
  //   }
  //   isLoadingProfilePage.value = false;
  // }

  uploadImageProfile(context, {ImageSource? media}) async {
    isLoadingUploadImage.value = true;
    XFile? image;
    final ImagePicker picker = ImagePicker();
    var img = await picker.pickImage(source: media!);
    image = img;
    final avatarFile = File(image!.path);
    final fileExt = avatarFile.path.split('.').last;
    String? nameFile = "${DateTime.now().toIso8601String()} + $fileExt";
    try {
      await vars.client.storage.from('image_profile').upload(
          'public/$nameFile', avatarFile,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false));
      var resultPulicURL =
          vars.client.storage.from('avatars').getPublicUrl('public/$nameFile');
      // print(resultPulicURL);
      String? fullURL = urlPhotoSupabase.value + resultPulicURL;
      await vars.client
          .from('cr_profiles')
          .update({'url_profile': fullURL}).eq('user_uuid', id);
      isLoadingUploadImage.value = false;
    } catch (e) {
      kAlertGagal(context, title: e.toString());
      isLoadingUploadImage.value = false;
    }
    isLoadingUploadImage.value = false;
  }
}
