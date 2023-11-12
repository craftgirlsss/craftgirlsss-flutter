import 'package:craftgirlsss/src/controllers/GetxController/profile_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldv2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEmail extends StatefulWidget {
  final String? email;
  const EditEmail({super.key, this.email});

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  TextEditingController emailC = TextEditingController();
  bool? checkedValue = true;
  ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    if (controller.profileModels[0].email == null) {
      emailC = TextEditingController(text: widget.email);
    } else {
      emailC = TextEditingController(text: controller.profileModels[0].email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(title: "Edit Email", autoImplyLeading: true),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Obx(
            () => controller.isLoadingProfilePage.value == true
                ? const Text("Get Information")
                : textFieldCustomized(
                    controller: emailC,
                    height: 43,
                    preffixIcon: true,
                    hintText: "Email",
                    icon: Icons.email),
          ),
          const SizedBox(height: 15),
          Center(
            child:
                kButtonsNew(context, label: "Selanjutnya", onPressed: () async {
              if (emailC.text.isNotEmpty) {
                // print('mengirim data');
              }
            }),
          ),
          const SizedBox(height: 10),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
              offset: const Offset(-15, 0),
              child: Text(
                "Kirimkan saya notifikasi tentang produk trend, dan produk dengan tawaran terbaik.",
                style: sfPro(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              ),
            ),
            value: checkedValue,
            onChanged: (newValue) {
              setState(() {
                checkedValue = newValue;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          )
        ],
      ),
    );
  }
}
