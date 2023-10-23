import 'package:craftgirlsss/src/helpers/paddings/defaultpadding.dart';
import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

class LaporkanBug extends StatefulWidget {
  const LaporkanBug({super.key});

  @override
  State<LaporkanBug> createState() => _LaporkanBugState();
}

class _LaporkanBugState extends State<LaporkanBug> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: defaultAppBar(
            autoImplyLeading: true,
            title: "Laporkan Bug Sistem",
            withActions: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: Colors.black54,
                  size: 21,
                ),
                tooltip: "Laporkan Sekarang",
              )
            ]),
        body: ListView(
          padding: kDefaultPadding(),
          children: [
            TextField(
              style: sfPro(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(12),
                  hintText: 'Deskripsikan bug yang anda temukan',
                  hintStyle: sfPro(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  prefixIconColor: Colors.black54,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(3))),
              maxLines: 10,
              minLines: 1,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.video_file_outlined),
              title: Transform.translate(
                offset: const Offset(-16, 0),
                child: Text(
                  "Tambah Video",
                  style: sfPro(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.image_outlined),
              title: Transform.translate(
                offset: const Offset(-16, 0),
                child: Text(
                  "Tambah Gambar",
                  style: sfPro(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
