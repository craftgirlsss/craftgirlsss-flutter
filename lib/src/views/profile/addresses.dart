import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/textfields/textfieldsearch.dart';
import 'package:flutter/material.dart';

class LokasiPengiriman extends StatefulWidget {
  const LokasiPengiriman({super.key});

  @override
  State<LokasiPengiriman> createState() => _LokasiPengirimanState();
}

class _LokasiPengirimanState extends State<LokasiPengiriman> {
  TextEditingController searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: kAppBar(context,
            isTitle: true,
            autoImplyLeading: true,
            titleText: "Lokasi Pengiriman"),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kSearchTextField(
                controller: searchC, hintText: "Cari kabupaten atau kota"),
            const SizedBox(height: 5),
            ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.all(5),
              minLeadingWidth: 7,
              leading: const Icon(
                Icons.gps_fixed_rounded,
                color: Colors.black54,
              ),
              tileColor: Colors.grey.shade200,
              minVerticalPadding: 0,
              shape: RoundedRectangleBorder(
                //<-- SEE HERE
                borderRadius: BorderRadius.circular(5),
              ),
              dense: true,
              title: Text('Pakai lokasi saat ini',
                  style: titleInter(
                      color: Colors.black87,
                      fontSize: 13,
                      fontWeight: FontWeight.normal)),
              subtitle: Text("Sukodono".toUpperCase(),
                  style: titleInter(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ),
            const SizedBox(height: 10),
            Text("Daftar alamat saya",
                style: titleInter(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
