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
    bool? autoImplyLeading = false,
    bool? withActions = false,
    List<Widget>? actions}) {
  return AppBar(
    centerTitle: true,
    leading: autoImplyLeading == true
        ? InkWell(
            onTap: () => Get.back(),
            child: Image.asset('assets/icons/freshicons/ArrowBendUpLeft.png'))
        : null,
    title: Text(
      title ?? '',
      style: titleInter(
          color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: withActions == true ? actions : null,
  );
}
