import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/view-models/profilephoto/imageviewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget photo(context,
    {String? nama,
    Function()? onPressed,
    String? urlPhoto,
    String? email,
    bool? button}) {
  return Center(
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Column(
        children: [
          profilePhotoChange(context,
              onPressed: onPressed,
              button: button,
              urlProfile:
                  urlPhoto ?? 'https://googleflutter.com/sample_image.jpg'),
          Text(
            "$nama",
            style: title(),
          ),
          Text(
            "$email",
            style: title(),
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
              left: 75,
              child: Container(
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 19,
                    color: Colors.white,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
