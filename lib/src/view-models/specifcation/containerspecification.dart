import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget kProductSpecification(context, {Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Spesifikasi',
            style: titleInter(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black87,
          )
        ],
      ),
    ),
  );
}
