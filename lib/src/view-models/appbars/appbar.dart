import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar kAppBar(context,
    {bool? isTitle = false,
    String? titleText,
    bool? withLeadingData = false,
    List<Widget>? listData,
    bool? withLeadingImage = false,
    String? urlImage,
    Function()? onTapProfile,
    bool? autoImplyLeading = false}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: autoImplyLeading!,
    centerTitle: true,
    title: isTitle == true
        ? Text(
            titleText!,
            style: title(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          )
        : null,
    backgroundColor: const Color(0xfffffcb9),
    leading: autoImplyLeading == true
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 23,
              color: Colors.black,
            ))
        : null,
    actions: withLeadingData == false
        ? [
            withLeadingImage == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 9, right: 9),
                    child: GestureDetector(
                      onTap: onTapProfile,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: urlImage != null
                                  ? NetworkImage(urlImage)
                                  : const NetworkImage(
                                      'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),
                  )
                : Container()
          ]
        : listData,
  );
}

AppBar defaultAppBar(
    {String? title,
    bool? centerTitle = true,
    bool? autoImplyLeading = false,
    bool? withActions = false,
    List<Widget>? actions}) {
  return AppBar(
    titleSpacing: 0,
    centerTitle: centerTitle,
    leading: autoImplyLeading == true
        ? InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              weight: 0.5,
            ))
        : null,
    title: Text(
      title ?? '',
      style: sfPro(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: withActions == true ? actions : null,
  );
}
