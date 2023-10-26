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
          style: sfPro(
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

Widget listTileProfileV3(
    {String? title = '',
    Function()? onPressed,
    String? value = '',
    Color? valueColor = Colors.black45,
    String? iconAsset = '',
    Color? color = Colors.white}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        color: Colors.transparent,
        height: 50,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    iconAsset!,
                    errorBuilder: (context, error, stackTrace) =>
                        const Text('Error'),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title!,
                    style: sfPro(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    value!,
                    style: sfPro(
                        color: valueColor,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: Colors.black45,
                  )
                ],
              ),
            ),
          ],
        )
        // ListTile(
        //     tileColor: color,
        //     dense: true,
        //     minLeadingWidth: 3,
        //     onTap: onPressed,
        //     title: Text(
        //       title!,
        //       style: sfPro(
        //           color: Colors.black54,
        //           fontSize: 15,
        //           fontWeight: FontWeight.normal),
        //     ),
        //     leading: Image.asset(
        //       iconAsset!,
        //       errorBuilder: (context, error, stackTrace) => const Text('Error'),
        //     ),
        //     trailing: const Icon(
        //       Icons.arrow_forward_ios_rounded,
        //       size: 18,
        //       color: Colors.black54,
        //     )),
        ),
  );
}

Widget listTileWithoutIconLeading(
    {String? title = '-',
    Function()? onPressed,
    String? value,
    double topLeftRadius = 0,
    double bottomLeftRadius = 0,
    double topRigthRadius = 0,
    double bottomRightRadius = 0,
    bool? withDivider = true,
    bool? withBorderRadius = false,
    double? size = 15,
    Color? color = Colors.transparent}) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      children: [
        Container(
            height: 38,
            decoration: BoxDecoration(
                color: color,
                borderRadius: withBorderRadius == true
                    ? BorderRadius.only(
                        topLeft: Radius.circular(topLeftRadius),
                        bottomLeft: Radius.circular(bottomLeftRadius),
                        bottomRight: Radius.circular(bottomRightRadius),
                        topRight: Radius.circular(topRigthRadius))
                    : BorderRadius.zero),
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  color: Colors.transparent,
                  child: Text(
                    title!,
                    style: sfPro(
                        color: Colors.black54,
                        fontSize: size,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: Row(children: [
                    Text(
                      value ?? 'Atur Sekarang',
                      style: sfPro(
                          color: Colors.black54,
                          fontSize: size,
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
        withDivider == true
            ? const Divider()
            : const SizedBox(height: 0, width: 0)
      ],
    ),
  );
}
