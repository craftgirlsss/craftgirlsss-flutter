import 'package:craftgirlsss/src/helpers/formatcurrency/formatcurrency.dart';
import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'dart:io';
import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/helpers/getrandom/getrandomstring.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/listtiles/listtileprofile.dart';
import 'package:craftgirlsss/src/view-models/loadings/loading.dart';
import 'package:craftgirlsss/src/view-models/nodata/nodata.dart';
import 'package:craftgirlsss/src/view-models/popup/alerttidaktau/alerttidaktau.dart';
import 'package:craftgirlsss/src/view-models/profilephoto/profilephoto.dart';
import 'package:craftgirlsss/src/view-models/rows/rowsinfopengiriman/rowsinfopengiriman.dart';
import 'package:craftgirlsss/src/views/login/login.dart';
import 'package:craftgirlsss/src/views/profile/NextPay/nextpaydashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'NextPay/nextpay.dart';
import 'address/addresses.dart';
import 'editprofile/editprofile.dart';
import 'laporkanbug/laporkanbug.dart';
import 'mulaijualan/mulaijualan.dart';
import 'prettycoin/prettycoin.dart';
import 'resetpassword/resetpassword.dart';
import 'voucher/voucher.dart';

class ProfileV2 extends StatefulWidget {
  const ProfileV2({super.key});

  @override
  State<ProfileV2> createState() => _ProfileV2State();
}

class _ProfileV2State extends State<ProfileV2> {
  ProfileController profileC = Get.put(ProfileController());

  bool? nextpayisactive;
  Future getNextPayRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('nextpay_active');
  }

  @override
  void initState() {
    super.initState();
    getNextPayRegistered()
        .then((value) => setState(() => nextpayisactive = value));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await profileC.fetchProfile();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Obx(
              () => profileC.isLoadingProfilePage.value == true
                  ? kLoading()
                  : profileC.profileModels.isNotEmpty
                      ? profileInfo(context,
                          voucher: 0,
                          whislist: 0,
                          button: true,
                          urlPhoto:
                              "https://zhfjjcaxzhmrexhkzest.supabase.co/storage/v1/object/public/${profileC.profileModels[0].urlProfile}",
                          email: profileC.profileModels[0].email
                              ?.replaceRange(2, 6, '*******'),
                          nama: profileC.profileModels[0].name,
                          onPressedButtonChange: () async {
                          getImage(ImageSource.gallery);
                        })
                      : kNoData(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: kRowsInfoPengiriman(),
            ),
            const SizedBox(height: 10),
            Obx(() => listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/Usernew.png',
                onPressed: profileC.profileModels.isNotEmpty
                    ? () {
                        Get.to(() => const EditProfile());
                      }
                    : null,
                title: "Edit Profil")),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/MapPinLinenew.png',
                onPressed: () {
                  Get.to(() => const LokasiPengiriman());
                },
                title: "Edit Alamat Pengiriman"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/Heartnew.png',
                onPressed: () {},
                title: "Favorit Saya"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/voucher.png',
                onPressed: () {
                  Get.to(() => const VoucherPage());
                },
                value: "Pakai Vouchermu",
                title: "Voucherku"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/Coins.png',
                onPressed: () {
                  Get.to(() => const PrettyCoin());
                },
                title: "Next Coins"),
            Obx(
              () => listTileProfileV3(
                  iconAsset: 'assets/icons/freshicons/Wallet.png',
                  onPressed: profileC.profileModels.isNotEmpty
                      ? () {
                          if (nextpayisactive == false) {
                            Get.to(() => const NextPay());
                          } else {
                            Get.to(() => const NextPayDashboard());
                          }
                        }
                      : null,
                  valueColor: Colors.green.shade500,
                  value: profileC.isLoadingProfilePage.value == true
                      ? ""
                      : profileC.profileModels.isNotEmpty
                          ? profileC.profileModels[0].nextPayActive == true
                              ? formatCurrency.format(
                                  profileC.profileModels[0].nextPayWallet)
                              : 'Aktifkan Sekarang'
                          : '',
                  title: "NextPay"),
            ),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/Group.png',
                onPressed: () {
                  Get.to(() => const MulaiJualan());
                },
                value: "Registrasi Gratis",
                title: "Mulai Jualan"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/Password(1).png',
                onPressed: () {
                  Get.to(() => ResetPassword(
                        email: profileC.profileModels[0].email,
                      ));
                },
                title: "Ubah Kata Sandi"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/History.png',
                onPressed: () {},
                title: "Riwayat Transaksi"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/StarHalf.png',
                onPressed: () {},
                title: "Beri Rating App"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/BugBeetle.png',
                onPressed: () {
                  Get.to(() => const LaporkanBug());
                },
                title: "Laporkan Bug"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/ChatsCirclenew.png',
                onPressed: () {},
                title: "Chat Admin"),
            listTileProfileV3(
                iconAsset: 'assets/icons/freshicons/SignOutnew.png',
                onPressed: () {
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
                },
                title: "Sign Out"),
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

/* 
profileC.profileModels[0].nextPayActive == true
                    ? formatCurrency
                        .format(profileC.profileModels[0].nextPayWallet)
                    : 
*/