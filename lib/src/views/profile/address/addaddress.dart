import 'package:craftgirlsss/src/controllers/GetxController/address_controller.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/buttons/elevatedbuttons.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/nolimitpaddingtextfield.dart';
import 'package:craftgirlsss/src/views/profile/address/listaddressprovinsi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage>
    with TickerProviderStateMixin {
  AddressController addressC = Get.put(AddressController());
  TextEditingController nameC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  TextEditingController provinceC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  TextEditingController blokRumahC = TextEditingController();
  bool light1 = false;
  String? pilihan;
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    // provinceC = TextEditingController(text: addressC.provinceName.value.isNotEmpty ? addressC.provinceName.value );
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  _toggleContainer() {
    if (_animation?.status != AnimationStatus.completed) {
      _controller?.forward();
    } else {
      _controller?.animateBack(0, duration: const Duration(seconds: 2));
    }
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: defaultAppBar(
            title: "Tambah Lokasi Pengiriman", autoImplyLeading: true),
        body: ListView(
          children: [
            const SizedBox(height: 5),
            Text(
              '  Info Saya',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 5),
            kNoLimitPaddingTextField(controller: nameC, hint: 'Nama Lengkap'),
            const SizedBox(height: 2),
            kNoLimitPaddingTextField(controller: noHpC, hint: 'Nomor HP'),
            const SizedBox(height: 5),
            Text(
              '  Alamat Saya',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 5),
            Obx(
              () => addressC.provinceName.value.isNotEmpty
                  ? kNoLimitPaddingTextField(
                      controller: TextEditingController(
                          text:
                              "${addressC.provinceName.value}, ${addressC.kabupatenName.value}, ${addressC.kecamatanName.value}, ${addressC.postalcode.value}"),
                      hint: 'Provinsi, Kota, Kecamatan, Kode Pos',
                      onTap: () {
                        Get.to(() => const ListOfAddressProvince());
                      },
                      suffixIcon: true)
                  : kNoLimitPaddingTextField(
                      controller: provinceC,
                      hint: 'Provinsi, Kota, Kecamatan, Kode Pos',
                      onTap: () {
                        Get.to(() => const ListOfAddressProvince());
                      },
                      suffixIcon: true),
            ),
            const SizedBox(height: 2),
            kNoLimitPaddingTextField(
                controller: detailC, hint: 'Nama Jalan, Gedung, No. Rumah'),
            const SizedBox(height: 2),
            kNoLimitPaddingTextField(
                controller: blokRumahC,
                hint: 'Detail lainnya (Contoh: Blok i5/07)'),
            const SizedBox(height: 5),
            Text(
              '  Pengaturan Alamat Saya',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tandai Sebagai',
                        style: TextStyle(color: Colors.black54),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                pilihan = 'Kantor';
                                _toggleContainer();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: const Text('Kantor'),
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              setState(() {
                                pilihan = 'Rumah';
                                _toggleContainer();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: const Text('Rumah'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  pilihan != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizeTransition(
                              sizeFactor: _animation!,
                              axis: Axis.vertical,
                              child: Text(
                                'Anda memilih : $pilihan',
                                style: titleInter(
                                    fontSize: 14,
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            // Text(
                            //   'Anda memilih : $pilihan',
                            //   style: titleInter(
                            //       fontSize: 14,
                            //       color: Colors.green.shade600,
                            //       fontWeight: FontWeight.normal),
                            // ),
                          ],
                        )
                      : const SizedBox(height: 0, width: 0),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Atur sebagai alamat utama',
                    style: titleInter(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  Switch(
                    thumbIcon: thumbIcon,
                    value: light1,
                    onChanged: (bool value) {
                      setState(() {
                        light1 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: kButtons(context,
                  backgroundColor: Colors.green.shade300,
                  label: "Tambah Alamat", onPressed: () async {
                // print(
                //     "${addressC.provinceName.value}, ${addressC.kabupatenName.value}, ${addressC.kecamatanName.value}, ${addressC.postalcode.value}, $pilihan, ${blokRumahC.text}, ${noHpC.text}, ${detailC.text}, ${nameC.text}, $light1");
                await addressC.insertAddress(context,
                    aturSebagai: pilihan,
                    desa: addressC.kecamatanName.value,
                    detailLainnya: blokRumahC.text,
                    fullAddress: detailC.text,
                    isdefault: light1,
                    kabupaten: addressC.kabupatenName.value,
                    namaPenerima: nameC.text,
                    nomorHpPenerima: noHpC.text,
                    postalCode: addressC.postalcode.value,
                    province: addressC.provinceName.value);
              }),
            )
          ],
        ),
      ),
    );
  }
}
