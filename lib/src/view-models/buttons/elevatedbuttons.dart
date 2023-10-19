import 'package:animated_button/animated_button.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget kButtons(
  context, {
  String? label,
  Function()? onPressed,
  bool? withIcon = false,
  IconData? icons,
  Color? labelColor = Colors.white,
  Color backgroundColor = Colors.green,
  double? fonSize = 20,
}) {
  return AnimatedButton(
    color: backgroundColor,
    shape: BoxShape.rectangle,
    width: 150,
    height: 40,
    onPressed: onPressed!,
    enabled: true,
    shadowDegree: ShadowDegree.light,
    child: withIcon == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                color: Colors.white,
                size: 19,
              ),
              const SizedBox(width: 7),
              Text(
                label!,
                style: title(color: labelColor, fontSize: fonSize),
              )
            ],
          )
        : Text(
            label!,
            style: title(color: labelColor, fontSize: fonSize),
          ),
  );

  // SizedBox(
  //   height: 47,
  //   width: MediaQuery.of(context).size.width - 50,
  //   child: ElevatedButton(
  //     onPressed: onPressed,
  //     style: ElevatedButton.styleFrom(
  //       elevation: 0,
  //       backgroundColor: backgroundColor,
  //       shape: const StadiumBorder(side: BorderSide(color: Colors.black54)),
  //     ),
  //     child: Text(
  //       label!,
  //       style: title(color: labelColor, fontSize: fonSize),
  //     ),
  //   ),
  // );
}

Widget kButtonsWithImage(
  context, {
  String? label,
  Function()? onPressed,
  bool? withIcon = false,
  Widget? icons,
  Color? labelColor = Colors.white,
  Color backgroundColor = Colors.green,
  double? fonSize = 17,
}) {
  return AnimatedButton(
    color: backgroundColor,
    shape: BoxShape.rectangle,
    width: 150,
    height: 40,
    onPressed: onPressed!,
    enabled: true,
    shadowDegree: ShadowDegree.light,
    child: withIcon == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icons!,
              const SizedBox(width: 7),
              Text(
                label!,
                style: title(color: labelColor, fontSize: fonSize),
              )
            ],
          )
        : Text(
            label!,
            style: titleInter(
                color: labelColor,
                fontSize: fonSize,
                fontWeight: FontWeight.bold),
          ),
  );
}

Widget kButtonsNew(
  context, {
  String? label,
  Function()? onPressed,
  IconData? icons,
  Color? labelColor = Colors.white,
  Color backgroundColor = Colors.green,
  double? fontSize = 15,
}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size.fromHeight(44),
        backgroundColor: backgroundColor,
      ),
      child: Text(
        label ?? '-',
        style: titleInter(
            fontSize: fontSize,
            color: labelColor,
            fontWeight: FontWeight.normal),
      ));
}
