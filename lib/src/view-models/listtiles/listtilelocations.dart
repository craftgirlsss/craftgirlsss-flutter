import 'package:craftgirlsss/src/view-models/containers/containerdefault/defaulticon.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

ListTile kListTileMyLocation(
    {String? descriptionLocation,
    Function()? onTap,
    bool? isDefault,
    String? title}) {
  return ListTile(
    onTap: onTap,
    contentPadding: const EdgeInsets.all(7),
    minLeadingWidth: 7,
    leading: const Icon(
      Icons.place_outlined,
      color: Colors.black54,
    ),
    tileColor: Colors.grey.shade200,
    minVerticalPadding: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    dense: true,
    title: Text(title ?? '-',
        style: sfPro(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.normal)),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            descriptionLocation != null
                ? descriptionLocation.toUpperCase()
                : '-',
            style: sfPro(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.normal)),
        const SizedBox(height: 5),
        isDefault == true
            ? kDefaultSelected()
            : const SizedBox(height: 0, width: 0)
      ],
    ),
  );
}

ListTile kMyCurrentLocation(
    {String? descriptionLocation, Function()? onTap, bool? isDefault}) {
  return ListTile(
    onTap: onTap,
    contentPadding: const EdgeInsets.all(7),
    minLeadingWidth: 7,
    leading: const Icon(
      Icons.gps_fixed_rounded,
      color: Colors.black54,
    ),
    tileColor: Colors.grey.shade200,
    minVerticalPadding: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    dense: true,
    title: Text('Pakai lokasi saat ini',
        style: sfPro(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.normal)),
    subtitle: Text(
        descriptionLocation != null ? descriptionLocation.toUpperCase() : '-',
        style: sfPro(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.normal)),
  );
}
