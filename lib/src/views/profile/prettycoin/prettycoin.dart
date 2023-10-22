import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:flutter/material.dart';

class PrettyCoin extends StatefulWidget {
  const PrettyCoin({super.key});

  @override
  State<PrettyCoin> createState() => _PrettyCoinState();
}

class _PrettyCoinState extends State<PrettyCoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(autoImplyLeading: true, title: "Pretty Koin"),
    );
  }
}
