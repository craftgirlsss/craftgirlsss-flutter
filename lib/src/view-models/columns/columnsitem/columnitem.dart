import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget kColumnItem(
    {String? urlAsset = '', String? name = '', Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          urlAsset!,
          errorBuilder: (context, error, stackTrace) => const Text('Error'),
        ),
        const SizedBox(height: 5),
        Text(
          name!,
          style: sfPro(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        )
      ],
    ),
  );
}
