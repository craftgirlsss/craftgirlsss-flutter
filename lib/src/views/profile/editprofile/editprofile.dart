import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'dart:io';
import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/helpers/getrandom/getrandomstring.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:craftgirlsss/src/view-models/nodata/nodata.dart';
import 'package:craftgirlsss/src/view-models/profilephoto/profilephoto.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldv2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileController profileC = Get.put(ProfileController());
  TextEditingController? emailC;
  TextEditingController? namaC;
  TextEditingController? nomorC;

  @override
  void initState() {
    super.initState();
    emailC =
        TextEditingController(text: profileC.profileModels[0].email ?? '-');
    namaC = TextEditingController(
        text: profileC.profileModels[0].name ?? 'Unknown');
    nomorC =
        TextEditingController(text: profileC.profileModels[0].phone ?? '-');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: defaultAppBar(title: "Edit Profil", autoImplyLeading: true),
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
            const SizedBox(height: 20),
            textFieldV2(controller: namaC, height: 45, hintText: "Nama"),
            const SizedBox(height: 10),
            textFieldV2(controller: emailC, height: 45, hintText: "Email"),
            const SizedBox(height: 10),
            textFieldV2(controller: nomorC, height: 45, hintText: "Nomor HP"),
            const SizedBox(height: 10),
            Center(
              child: kButtons(context,
                  backgroundColor: Colors.green.shade400,
                  fonSize: 20,
                  label: "Simpan", onPressed: () async {
                // await profileC.
              }),
            )
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
