import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Widget kButtons(
  context, {
  String? label,
  Function()? onPressed,
  Color? labelColor = Colors.white,
  Color? backgroundColor,
  double? fonSize = 20,
}) {
  return SizedBox(
    height: 47,
    width: MediaQuery.of(context).size.width - 50,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const StadiumBorder(),
      ),
      child: Text(
        label!,
        style: title(color: labelColor, fontSize: fonSize),
      ),
    ),
  );
}
