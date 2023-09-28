import 'package:craftgirlsss/src/view-models/appbars/appbaronlytitle.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/listtiles/listtileprofile.dart';
import 'package:craftgirlsss/src/view-models/popup/alerttidaktau/alerttidaktau.dart';
import 'package:craftgirlsss/src/view-models/profilephoto/profilephoto.dart';
import 'package:craftgirlsss/src/view-models/rows/rowsinfopengiriman/rowsinfopengiriman.dart';
import 'package:craftgirlsss/src/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffcb9),
      appBar: kAppBarOnlyTitle(titleText: "Profile"),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          photo(context,
              button: true,
              email: "email@example.com",
              nama: "Putra",
              onPressed: () {}),
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
                SharedPreferences prefs = await SharedPreferences.getInstance();
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
    );
  }

  // XFile? image;

  // String? urlUploadedImage;

  // final ImagePicker picker = ImagePicker();

  // //fungsi untuk mengambil, upload dan get gambar
  // Future getImage(ImageSource media) async {
  //   var img = await picker.pickImage(source: media);
  //   setState(() {
  //     image = img;
  //   });
  //   final avatarFile = File(image!.path);
  //   final fileExt = avatarFile.path.split('.').last;
  //   final fileName = '${DateTime.now()}.$fileExt';
  //   //upload image
  //   final result = await vars.client.storage.from('avatars').upload(
  //         "public/$fileName",
  //         avatarFile,
  //         fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
  //       );
  //   String? fullURL = settingC.urlPhotoSupabase.value + result;
  //   //update profile
  //   var id = Supabase.instance.client.auth.currentUser!.id;
  //   await vars.client
  //       .from('profiles')
  //       .update({'profile_url': fullURL}).eq('user_uuid', id);
  // }
}
