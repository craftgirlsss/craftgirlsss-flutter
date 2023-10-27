import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget imageButton(
    {Function()? onPressed,
    String? label = '-',
    String? urlImage = '',
    double? maxHeight = 66,
    double? maxWidth = 66,
    double? width = 30,
    double? height = 30,
    double? fontSize = 13,
    Color? labelColor,
    FontWeight? fontWeight = FontWeight.normal}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: maxHeight,
      width: maxWidth,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(urlImage!, width: width, height: height),
          const SizedBox(height: 1),
          Flexible(
            child: Text(label!,
                textAlign: TextAlign.center,
                style: sfPro(
                    color: labelColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight)),
          )
        ],
      ),
    ),
  );
}
