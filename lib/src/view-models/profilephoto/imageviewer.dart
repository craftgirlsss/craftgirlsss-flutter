import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final bool? networkImage;
  final String urlImage;
  const ImageViewer({super.key, required this.urlImage, this.networkImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.transparent,
          child: PhotoView(
              imageProvider: networkImage == true
                  ? NetworkImage(urlImage)
                  : Image.asset('assets/images/profiless.png').image)),
    );
  }
}
