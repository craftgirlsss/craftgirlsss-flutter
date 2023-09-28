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
          style: const TextStyle(
            fontFamily: "Caveat",
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    ),
  );
}
