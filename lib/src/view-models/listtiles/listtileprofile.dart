import 'package:flutter/material.dart';

Widget listTileProfile(
    {String? title = '',
    bool? threeLine = false,
    String? subtitle = '',
    Function()? onPressed,
    String? iconAsset = ''}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: ListTile(
      minVerticalPadding: 10,
      style: ListTileStyle.drawer,
      tileColor: Colors.white,
      selectedTileColor: Colors.grey.shade400,
      onTap: onPressed,
      contentPadding:
          const EdgeInsets.only(left: 20, right: 12, top: 0, bottom: 0),
      isThreeLine: threeLine!,
      title: Text(
        title!,
        style: const TextStyle(
          fontFamily: "Caveat",
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      leading: Image.asset(
        iconAsset!,
        errorBuilder: (context, error, stackTrace) => const Text('Error'),
      ),
      trailing: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.shade300),
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 17,
            color: Colors.black54,
          )),
    ),
  );
}
