import 'package:flutter/material.dart';
import '../../fontstyles/title.dart';

Container kDefaultSelected() {
  return Container(
    width: 56,
    height: 28,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.red.shade200,
        border: Border.all(color: Colors.red.shade700)),
    child: Text(
      'Default',
      style: titleInter(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
    ),
  );
}

GestureDetector kDefaultSelectedAddress({String? name, Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 56,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      child: Text(
        name ?? 'Default',
        style: titleInter(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
      ),
    ),
  );
}
