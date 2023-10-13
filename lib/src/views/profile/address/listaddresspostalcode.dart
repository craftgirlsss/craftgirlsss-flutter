import 'package:craftgirlsss/src/controllers/GetxController/address_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldv2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfAddressPostalCode extends StatefulWidget {
  const ListOfAddressPostalCode({super.key});

  @override
  State<ListOfAddressPostalCode> createState() =>
      _ListOfAddressPostalCodeState();
}

class _ListOfAddressPostalCodeState extends State<ListOfAddressPostalCode> {
  final kodePos = TextEditingController();
  AddressController addressC = Get.put(AddressController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(autoImplyLeading: true, title: "Kode Pos"),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text('Tuliskan Kode Pos',
                style: titleInter(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(height: 10),
          textFieldV2(controller: kodePos, height: 45, hintText: "Kode Pos"),
          const SizedBox(height: 15),
          Obx(() => addressC.isLoadingGetProvince.value
              ? TextButton(
                  onPressed: () async {
                    addressC.postalcode.value = kodePos.text;
                    Navigator.of(context)
                      ..pop()
                      ..pop()
                      ..pop()
                      ..pop();
                  },
                  child: const Text('Simpan'))
              : TextButton(
                  onPressed: () async {
                    addressC.postalcode.value = kodePos.text;
                    Navigator.of(context)
                      ..pop()
                      ..pop()
                      ..pop()
                      ..pop();
                  },
                  child: const Text('Simpan'))),
        ],
      ),
    );
  }
}
