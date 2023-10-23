import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/profilephoto/imageviewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget photo(context,
    {String? nama,
    Function()? onPressedButtonChange,
    String? urlPhoto,
    String? email,
    bool? button}) {
  return Stack(children: [
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backgroundDefault.jpg'))),
    ),
    Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Column(
          children: [
            profilePhotoChange(context,
                onPressed: onPressedButtonChange,
                button: button,
                urlProfile:
                    urlPhoto ?? 'https://googleflutter.com/sample_image.jpg'),
            Text(
              "$nama",
              style: sfPro(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "$email",
              style: sfPro(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    ),
  ]);
}

Widget profilePhotoChange(context,
    {String? urlProfile, bool? button, Function()? onPressed}) {
  return Center(
    child: Container(
      width: 130,
      height: 130,
      color: Colors.transparent,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              if (urlProfile != 'tidak diset' || urlProfile != null) {
                Get.to(() => ImageViewer(
                      networkImage: true,
                      urlImage: urlProfile!,
                    ));
                // PhotoView(imageProvider: NetworkImage(urlProfile!)));
              } else {
                Get.to(() => const ImageViewer(
                      networkImage: false,
                      urlImage: 'assets/images/person-icon.jpg',
                    ));
                // PhotoView(
                //     imageProvider: const NetworkImage(
                //         'https://googleflutter.com/sample_image.jpg')));
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 0),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.black26),
                image: DecorationImage(
                    image: urlProfile != 'tidak diset' || urlProfile != null
                        ? NetworkImage(urlProfile!)
                        : const NetworkImage(
                            'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
          if (button == true)
            Positioned(
              bottom: 13,
              left: 80,
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.black54.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.edit,
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
