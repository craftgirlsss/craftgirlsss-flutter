import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/popup/alertberhasil/alertberhasil.dart';
import 'package:craftgirlsss/src/view-models/popup/alertgagal/alertgagal.dart';
import 'package:craftgirlsss/src/view-models/popup/alerttidaktau/alerttidaktau.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldv2.dart';
import 'package:flutter/material.dart';
import 'package:craftgirlsss/src/helpers/globalvariable/variablehelper.dart'
    as vars;
import 'package:get/get.dart';

class EditprofileName extends StatefulWidget {
  final String? name;
  const EditprofileName({super.key, this.name});

  @override
  State<EditprofileName> createState() => _EditprofileNameState();
}

class _EditprofileNameState extends State<EditprofileName> {
  TextEditingController? nameController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(title: "Edit Nama", autoImplyLeading: true),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          textFieldV2(controller: nameController, preffixIcon: false),
          const SizedBox(height: 10),
          Center(
            child: kButtonsNew(
              context,
              backgroundColor: Colors.green,
              onPressed: () async {
                if (nameController!.text == widget.name) {
                  kAlertTidakTau(context,
                      content: "Nama tidak boleh sama dengan sebelumnya",
                      onOK: () => Get.back(),
                      title: "Gagal",
                      isNeedCancelButton: false);
                } else {
                  try {
                    var id = vars.client.auth.currentUser?.id;
                    await vars.client.from('cr_profiles').update(
                        {'name': nameController!.text}).eq('user_uuid', id);
                    Future.delayed(Duration.zero, () {
                      kAlertBerhasil(context,
                          isNeedCancelButton: false,
                          onOK: () => Navigator.of(context)
                            ..pop()
                            ..pop(),
                          content: "Berhasil merubah data nama");
                    });
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.of(context)
                        ..pop()
                        ..pop();
                    });
                  } catch (e) {
                    // print(e);
                    kAlertGagal(context, title: "Gagal mengupdate nama");
                  }
                }
              },
              label: "Simpan",
            ),
          )
        ],
      ),
    );
  }
}
