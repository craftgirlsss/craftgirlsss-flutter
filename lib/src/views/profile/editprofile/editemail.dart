import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldv2.dart';
import 'package:flutter/material.dart';

class EditEmail extends StatefulWidget {
  const EditEmail({super.key});

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  TextEditingController emailC = TextEditingController();
  bool? checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(title: "Edit Email", autoImplyLeading: true),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          textFieldCustomized(
              controller: emailC,
              height: 43,
              preffixIcon: true,
              hintText: "Email",
              icon: Icons.email),
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
                style: titleInter(
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
