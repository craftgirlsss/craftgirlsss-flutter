import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Container kDescription(context, {String? description}) {
  return Container(
    padding: const EdgeInsets.all(10),
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deskripsi",
          style: titleInter(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 10),
        Text(
          description ?? '',
          style: titleInter(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}
