import 'dart:io';
import 'dart:math';

import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/helpers/getrandom/getrandomstring.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbaronlytitle.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/listtiles/listtileprofile.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:craftgirlsss/src/view-models/nodata/nodata.dart';
import 'package:craftgirlsss/src/view-models/popup/alerttidaktau/alerttidaktau.dart';
import 'package:craftgirlsss/src/view-models/profilephoto/profilephoto.dart';
import 'package:craftgirlsss/src/view-models/rows/rowsinfopengiriman/rowsinfopengiriman.dart';
import 'package:craftgirlsss/src/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  ProfileController profileC = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await profileC.fetchProfile();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffffcb9),
        appBar: kAppBarOnlyTitle(titleText: "Profile"),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Obx(
              () => profileC.isLoadingProfilePage.value == true
                  ? kLoading()
                  : profileC.profileModels.isNotEmpty
                      ? photo(context,
                          button: true,
                          urlPhoto:
                              "https://zhfjjcaxzhmrexhkzest.supabase.co/storage/v1/object/public/${profileC.profileModels[0].urlProfile}",
                          email: profileC.profileModels[0].email,
                          nama: profileC.profileModels[0].name,
                          onPressedButtonChange: () async {
                          getImage(ImageSource.gallery);
                          // await profileC.uploadImageProfile(context,
                          //     media: ImageSource.gallery);
                        })
                      : kNoData(),
            ),
            const SizedBox(height: 30),
            kRowsInfoPengiriman(),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(color: Colors.black54, thickness: 1),
            ),
            const SizedBox(height: 10),
            listTileProfile(
                title: "Edit data diri",
                iconAsset: 'assets/icons/edit-profile.png'),
            listTileProfile(
                title: "Edit Alamat Pengiriman",
                iconAsset: 'assets/icons/place.png'),
            listTileProfile(
                title: "Favorit saya", iconAsset: 'assets/icons/favorit.png'),
            listTileProfile(
                title: "Dompetku", iconAsset: 'assets/icons/wallet.png'),
            listTileProfile(
                title: "Beri bintang", iconAsset: 'assets/icons/star.png'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90),
              child: kButtons(context,
                  backgroundColor: Colors.red.shade200,
                  label: "Keluar",
                  labelColor: Colors.black54, onPressed: () {
                kAlertTidakTau(context,
                    title: "Log Out",
                    isNeedCancelButton: true,
                    content: "Apakah anda yakin keluar dari akun anda?",
                    onOK: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await vars.client.auth.signOut();
                  await prefs.setBool('loggedIn', false);
                  Future.delayed(
                      const Duration(seconds: 1),
                      () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false));
                });
              }),
            ),
          ],
        ),
      ),
    );
  }

  XFile? image;
  String? urlUploadedImage;
  final ImagePicker picker = ImagePicker();

  //fungsi untuk mengambil, upload dan get gambar
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
    final avatarFile = File(image!.path);
    final fileExt = avatarFile.path.split('.').last;
    final fileName = '${getRandomString(6)}.$fileExt';
    //upload image
    final result = await vars.client.storage.from('avatars').upload(
          "public/$fileName",
          avatarFile,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );
    String? fullURL = profileC.urlPhotoSupabase.value + result;
    //update profile
    var id = Supabase.instance.client.auth.currentUser!.id;
    await vars.client
        .from('cr_profiles')
        .update({'url_profile': fullURL}).eq('user_uuid', id);
  }
}
