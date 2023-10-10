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
    width: MediaQuery.of(context).size.width - 50,
    height: 45,
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
