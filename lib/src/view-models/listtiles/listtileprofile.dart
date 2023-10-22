import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
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

Widget listTileProfileV2(
    {String? title = '',
    Function()? onPressed,
    String? iconAsset = '',
    Color? color = Colors.white}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: ListTile(
        tileColor: color,
        dense: true,
        minLeadingWidth: 3,
        onTap: onPressed,
        title: Text(
          title!,
          style: titleInter(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        leading: Image.asset(
          iconAsset!,
          errorBuilder: (context, error, stackTrace) => const Text('Error'),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.black54,
        )),
  );
}

Widget listTileWithoutIconLeading(
    {String? title = '-', Function()? onPressed, String? value}) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      children: [
        Container(
            height: 38,
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Text(
                    title!,
                    style: titleInter(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: Row(children: [
                    Text(
                      value ?? 'Atur Sekarang',
                      style: titleInter(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 17,
                      color: Colors.black54,
                    ),
                  ]),
                )
              ],
            )),
        const Divider()
      ],
    ),
  );
}
