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
  return Center(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 5),
          Text(
            "$email",
            style: sfPro(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ),
  );
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

Widget profilePhoto(context,
    {String? urlProfile, bool? button, Function()? onPressed}) {
  return Center(
    child: Container(
      width: 94,
      height: 94,
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
              bottom: 8,
              right: 16,
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 15,
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

Container profileInfo(context,
    {String? nama,
    Function()? onPressedButtonChange,
    String? urlPhoto,
    int? whislist,
    int? voucher,
    String? email,
    bool? button}) {
  return Container(
    height: MediaQuery.of(context).size.height / 5.5,
    width: MediaQuery.of(context).size.width,
    color: Colors.green.shade100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profilePhoto(context,
                  onPressed: onPressedButtonChange,
                  button: button,
                  urlProfile:
                      urlPhoto ?? 'https://googleflutter.com/sample_image.jpg'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama!,
                      style: sfPro(fontSize: 22, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: Colors.transparent,
                          child: RichText(
                            text: TextSpan(
                              text: '$whislist',
                              style: sfPro(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: ' Whislist',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: Colors.transparent,
                          child: RichText(
                            text: TextSpan(
                              text: '$whislist',
                              style: sfPro(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: ' Voucher',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            tooltip: "Edit Profile",
            icon: const Icon(Icons.edit, size: 19))
      ],
    ),
  );
}
