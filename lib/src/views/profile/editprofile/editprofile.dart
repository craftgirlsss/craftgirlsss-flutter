import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'dart:io';
import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/helpers/getrandom/getrandomstring.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/listtiles/listtileprofile.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:craftgirlsss/src/view-models/nodata/nodata.dart';
import 'package:craftgirlsss/src/view-models/popup/alertberhasil/alertberhasil.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:craftgirlsss/src/view-models/profilephoto/profilephoto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'editemail.dart';
import 'editnamatoko.dart';
import 'editprofilename.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileController profileC = Get.put(ProfileController());
  String? emailC;
  String? namaC;
  String? nomorC;
  String? gender;
  String? finaldate;
  String? namaToko;
  DateTime date = DateTime(2016, 10, 26);

  void showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    emailC = profileC.profileModels[0].email ?? '-';
    namaC = profileC.profileModels[0].name ?? 'Unknown';
    nomorC = profileC.profileModels[0].phone ?? '-';
    gender = profileC.profileModels[0].jenisKelamin ?? 'Atur Sekarang';
    finaldate = profileC.profileModels[0].dateOfBirth ?? 'Atur Sekarang';
    namaToko = profileC.profileModels[0].toko?.name;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await profileC.fetchProfile();
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: defaultAppBar(title: "Edit Profil", autoImplyLeading: true),
          body: Obx(
            () => profileC.isLoadingProfilePage.value == true
                ? kLoading()
                : profileC.profileModels.isNotEmpty
                    ? ListView(
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
                                        email: profileC.profileModels[0].email
                                            ?.replaceRange(2, 8, '******'),
                                        nama: profileC.profileModels[0].name,
                                        onPressedButtonChange: () async {
                                        getImage(ImageSource.gallery);
                                        // await profileC.uploadImageProfile(context,
                                        //     media: ImageSource.gallery);
                                      })
                                    : kNoData(),
                          ),
                          const SizedBox(height: 20),
                          listTileWithoutIconLeading(
                            value: namaC,
                            onPressed: () {
                              Get.to(() => EditprofileName(name: namaC));
                            },
                            title: "Nama",
                          ),
                          listTileWithoutIconLeading(
                              value: gender,
                              onPressed: () {
                                Get.defaultDialog(
                                    title: "Jenis Kelamin",
                                    content: setupAlertDialoadContainer());
                              },
                              title: "Jenis Kelamin"),
                          listTileWithoutIconLeading(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(
                                        1955), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2030));

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickedDate);
                                  setState(() {
                                    finaldate =
                                        formattedDate; //set output date to TextField value.
                                  });
                                  await vars.client
                                      .from('cr_profiles')
                                      .update({'dob': finaldate}).eq(
                                          'user_uuid', profileC.id);
                                  profileC.fetchProfile();
                                } else {
                                  // print("Date is not selected");
                                }
                              },
                              value: finaldate,
                              title: "Tanggal Lahir"),
                          listTileWithoutIconLeading(
                              value: namaToko ??
                                  profileC.profileModels[0].toko?.name,
                              onPressed: () {
                                Get.to(() => EditNamaToko(
                                      name: namaToko,
                                    ));
                              },
                              title: "Nama Toko"),
                          listTileWithoutIconLeading(
                              value: nomorC?.replaceRange(3, 9, '******'),
                              onPressed: () {},
                              title: "No. Handphone"),
                          listTileWithoutIconLeading(
                              value: emailC?.replaceRange(2, 8, '******'),
                              onPressed: () {
                                Get.to(() => const EditEmail());
                              },
                              title: "Email"),
                        ],
                      )
                    : const Center(
                        child: Text('Gagal memuat data'),
                      ),
          ),
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

  Widget setupAlertDialoadContainer() {
    return Container(
      color: Colors.transparent,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dataKelamin.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              setState(() async {
                gender = dataKelamin[index];
                try {
                  var id = vars.client.auth.currentUser?.id;
                  await vars.client
                      .from('cr_profiles')
                      .update({'jenis_kelamin': gender}).eq('user_uuid', id);
                  Future.delayed(Duration.zero, () {
                    kAlertBerhasil(context,
                        isNeedCancelButton: false,
                        onOK: () => Navigator.of(context)
                          ..pop()
                          ..pop(),
                        content: "Berhasil merubah data jenis kelamin");
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                  });
                } catch (e) {
                  // print(e);
                  kAlertGagal(context, title: "Gagal mengupdate jenis kelamin");
                }
              });
              Get.back();
            },
            title: Text(dataKelamin[index]),
          );
        },
      ),
    );
  }

  List dataKelamin = ['Pria', 'Wanita', 'Lainnya'];
}
