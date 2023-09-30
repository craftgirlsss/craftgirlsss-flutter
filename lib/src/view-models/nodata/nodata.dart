import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:flutter/material.dart';

Center kNoData() {
  return Center(
      child: Text("Tidak ada data",
          style: title(
              fontSize: 17,
              color: Colors.black54,
              fontWeight: FontWeight.bold)));
}
