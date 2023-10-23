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
            style: sfPro(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              'Lihat',
              style: sfPro(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          )
        ],
      ),
    ),
  );
}
