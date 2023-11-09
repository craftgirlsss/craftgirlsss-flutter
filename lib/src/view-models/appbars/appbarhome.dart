import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

AppBar kAppBarHome({int? lengthNotifications, int? lengthFavorite}) {
  return AppBar(
    leadingWidth: 110,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      "Beranda",
      style: titleHome(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
          tooltip: 'Chats',
          onPressed: () {
            // Get.to(() => const FavoritePage());
          },
          icon: lengthFavorite == null || lengthFavorite < 1
              ? const Icon(
                  Icons.favorite_border,
                  color: Colors.black54,
                )
              : badges.Badge(
                  position: badges.BadgePosition.custom(start: 10, bottom: 10),
                  badgeStyle: const badges.BadgeStyle(
                    borderSide: BorderSide(color: Colors.black54),
                    padding: EdgeInsets.all(5),
                  ),
                  badgeContent: Text(
                    lengthFavorite.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  child: Image.asset(
                      'assets/icons/freshicons/ChatCenteredDots.png'))),
      IconButton(
          tooltip: 'Favorit',
          onPressed: () {},
          icon: lengthNotifications == null || lengthNotifications < 1
              ? const Icon(
                  Icons.notifications_none,
                  color: Colors.black54,
                )
              : badges.Badge(
                  position: badges.BadgePosition.custom(start: 10, bottom: 10),
                  badgeStyle: const badges.BadgeStyle(
                    borderSide: BorderSide(color: Colors.black54),
                    padding: EdgeInsets.all(5),
                  ),
                  badgeContent: Text(
                    lengthNotifications.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  child: Image.asset('assets/icons/freshicons/Heartnew.png'))),
    ],
  );
}

AppBar kAppBarHomeV2({
  int? lengthNotifications,
  int? lengthFavorite,
  Function()? onPressedCamera,
  TextEditingController? controller,
}) {
  return AppBar(
    leadingWidth: 0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Transform.translate(
      offset: const Offset(-15, 0),
    ),
    title: SizedBox(
      height: 35,
      child: TextField(
        controller: controller,
        style: sfPro(fontSize: 14, color: Colors.orange.shade700),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: InputBorder.none,
          hintText: "Cari",
          hintStyle: sfPro(color: Colors.orange.shade700),
          suffixIcon: Image.asset('assets/icons/freshicons/camera.png'),
          prefixIcon: Image.asset(
            'assets/icons/freshicons/search.png',
            scale: 1.1,
          ),
        ),
      ),
    ),
    actions: [
      Center(
        child: GestureDetector(
            onTap: () {
              // Get.to(() => const FavoritePage());
            },
            child: lengthFavorite == null || lengthFavorite < 1
                ? const Icon(
                    Icons.favorite_border,
                    color: Colors.black54,
                  )
                : badges.Badge(
                    position:
                        badges.BadgePosition.custom(start: 10, bottom: 10),
                    badgeStyle: const badges.BadgeStyle(
                      borderSide: BorderSide(color: Colors.black54),
                      padding: EdgeInsets.all(5),
                    ),
                    badgeContent: Text(
                      lengthFavorite.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    child: Image.asset(
                        'assets/icons/freshicons/ChatCenteredDots.png'))),
      ),
      const SizedBox(width: 15),
      Center(
        child: GestureDetector(
            // tooltip: 'Favorit',
            onTap: () {},
            child: lengthNotifications == null || lengthNotifications < 1
                ? const Icon(
                    Icons.notifications_none,
                    color: Colors.black54,
                  )
                : badges.Badge(
                    position:
                        badges.BadgePosition.custom(start: 10, bottom: 10),
                    badgeStyle: const badges.BadgeStyle(
                      borderSide: BorderSide(color: Colors.black54),
                      padding: EdgeInsets.all(5),
                    ),
                    badgeContent: Text(
                      lengthNotifications.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    child:
                        Image.asset('assets/icons/freshicons/Heartnew.png'))),
      ),
      const SizedBox(width: 10),
    ],
  );
}
