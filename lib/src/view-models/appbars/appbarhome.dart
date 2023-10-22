import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

AppBar kAppBarHome({int? lengthNotifications, int? lengthFavorite}) {
  return AppBar(
    leadingWidth: 110,
    // automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      "Beranda",
      style: titleHome(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    actions: [
      // IconButton(
      //     tooltip: 'Cari',
      //     onPressed: () {},
      //     icon: Image.asset('assets/icons/search.png')),
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
