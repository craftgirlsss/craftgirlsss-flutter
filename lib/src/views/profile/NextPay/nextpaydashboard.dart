import 'package:craftgirlsss/src/view-models/appbars/appbar.dart';
import 'package:flutter/material.dart';

class NextPayDashboard extends StatefulWidget {
  const NextPayDashboard({super.key});

  @override
  State<NextPayDashboard> createState() => _NextPayDashboardState();
}

class _NextPayDashboardState extends State<NextPayDashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(autoImplyLeading: true, title: "Aktifasi NextPay"),
      body: ListView(
        children: const [Text("Hello")],
      ),
    );
  }
}
